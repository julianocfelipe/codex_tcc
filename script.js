import { readdirSync, statSync, readFileSync, writeFileSync } from 'fs';
import { join, extname, relative } from 'path';
import Gemini from './LLM/Gemini/Gemini.js';

/**
 * @param {String} dirPath - O caminho do diretório a ser lido.
 * @returns {Array< name : string, content : string >}
 */

const extensoesPermitidas = [
  '.js', '.ts', '.jsx', '.tsx',
  '.html', '.css', '.scss',
  '.json', '.md', '.txt',
  '.py', '.java', '.c', '.cpp', '.rb', '.go'
];

function readFilesRecursive(dirPath) {
  const result = [];

  function readDir(currentPath) {
    const items = readdirSync(currentPath);

    for (const item of items) {
      const fullPath = join(currentPath, item);
      const stats = statSync(fullPath);

      if (stats.isDirectory()) {
        readDir(fullPath);
      } else if (stats.isFile()) {
        const ext = extname(fullPath).toLowerCase();

        if (extensoesPermitidas.includes(ext)) {
          const content = readFileSync(fullPath, 'utf-8');
          result.push({
            name: relative(dirPath, fullPath),
            content: content
          });
        }
      }
    }
  }

  readDir(dirPath);
  return result;
}

function limparMarkdown(markdown, arquivoPath) {
  const linhas = markdown.split('\n');
  const linhasFiltradas = [];
  let linhasVaziasSeguidas = 0;

  for (let linha of linhas) {
    if (linha.toLowerCase().includes(arquivoPath.toLowerCase()) && linha.toLowerCase().includes('documentação')) {
      continue;
    }

    if (linha.trim() === '') {
      linhasVaziasSeguidas++;
      if (linhasVaziasSeguidas > 1) continue;
    } else {
      linhasVaziasSeguidas = 0;
    }

    linhasFiltradas.push(linha);
  }

  return linhasFiltradas.join('\n').trim();
}

// Caminho da pasta do projeto
const caminhoDaPasta = 'C:\\Users\\Rafae\\OneDrive\\Documentos\\Projetos\\devconnector_2.0-master';
const arquivos = readFilesRecursive(caminhoDaPasta);

const arquivosIgnorados = [
  'package.json', 'package-lock.json', 'yarn.lock',
  'README.md', 'readme.md', 'tsconfig.json', 'manifest.json'
];

// Prompt base
const promptBase = `Gere o conteúdo de um arquivo Markdown para a documentação técnica de um projeto. O Markdown deve incluir: 
- Código-fonte relevante (sem comentários);
- Tabelas para métodos, se aplicável;
- Estrutura clara com títulos.`;

async function gerarDocumentacaoCompleta() {
  const inicio = Date.now();

  const promessas = arquivos
    .filter(arquivo => !arquivosIgnorados.some(f => arquivo.name.toLowerCase().endsWith(f)))
    .map(async (arquivo) => {
      console.log(`Processando: ${arquivo.name}`);
      const jsonArquivo = JSON.stringify([arquivo], null, 2);
      const conteudo = await Gemini.generatMkWithJson(promptBase, jsonArquivo, 0.3);

      if (conteudo) {
        const markdownLimpo = limparMarkdown(conteudo, arquivo.name);
        return `\n## ${arquivo.name}\n\n${markdownLimpo}\n`;
      } else {
        console.warn(`Falha ao gerar documentação para ${arquivo.name}`);
        return '';
      }
    });

  const blocosMarkdown = await Promise.all(promessas);
  const markdownFinal = blocosMarkdown.filter(Boolean).join('\n\n');

  writeFileSync('./documentacao_final.mk', markdownFinal.trim());

  const fim = Date.now();
  const segundos = ((fim - inicio) / 1000).toFixed(2);
  console.log(`\n✅ Documentação completa gerada em documentacao_final.mk`);
  console.log(`🕒 Tempo total: ${segundos} segundos`);
}

await gerarDocumentacaoCompleta();

export default { readFilesRecursive };
