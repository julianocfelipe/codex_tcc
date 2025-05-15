import { existsSync, unlinkSync, readdirSync, statSync, readFileSync, writeFileSync } from 'fs';
import { join, extname, relative } from 'path';
import Gemini from './LLM/Gemini/Gemini.js';
import MarkdownPDF from 'markdown-pdf';

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

const caminhoDaPasta = 'C:\\Users\\Rafae\\OneDrive\\Área de Trabalho\\projEnrico\\faculdade\\linguagens formais\\LinguagensFormais\\linguagensformais';
const arquivos = readFilesRecursive(caminhoDaPasta);

const arquivosIgnorados = [
  'package.json', 'package-lock.json', 'yarn.lock',
  'README.md', 'readme.md', 'tsconfig.json', 'manifest.json'
];

const promptBase = `Gere o conteúdo de um arquivo Markdown para a documentação técnica de um projeto. O Markdown deve incluir: 
- Código-fonte relevante (sem comentários) não precisa gerar o código-fonte completo, apenas o necessário para a documentação;
- Tabelas para métodos, se aplicável;
- Estrutura clara com títulos.
- O usuário irá apenas ler então você deve preencher todas as informações necessárias para que o usuário consiga entender o funcionamento do projeto.`;

writeFileSync('./json.txt', arquivos.map(arquivo => JSON.stringify(arquivo)).join('\n'), 'utf-8');

async function gerarDocumentacaoCompleta() {
  const inicio = Date.now();

  const promessas = arquivos
    .filter(arquivo => !arquivosIgnorados.some(f => arquivo.name.toLowerCase().endsWith(f)))
    .map(async (arquivo) => {
      console.log(`Processando: ${arquivo.name}`);
      const jsonArquivo = JSON.stringify([arquivo], null, 2);
      const conteudo = await Gemini.generatMkWithJson(promptBase, jsonArquivo, 0.7);

      if (conteudo) {
        const markdownLimpo = limparMarkdown(conteudo, arquivo.name);
        return `\n${markdownLimpo}\n`;
      } else {
        console.warn(`Falha ao gerar documentação para ${arquivo.name}`);
        return '';
      }
    });

  const blocosMarkdown = await Promise.all(promessas);
  const markdownFinal = blocosMarkdown.filter(Boolean).join('\n\n');

  existsSync('./documentacaoArquivos.mk') && unlinkSync('./documentacaoArquivos.mk');
  writeFileSync('./documentacaoArquivos.mk', markdownFinal.trim());

  const fim = Date.now();
  const segundos = ((fim - inicio) / 1000).toFixed(2);
  console.log(`\n✅ Documentação completa gerada em documentacao_final.mk`);
  console.log(`🕒 Tempo total: ${segundos} segundos`);
}

async function gerarInicioDocumentacao(mk) {
  const promp = `Com base nesse arquivo mk "${mk}" gere o overview da documentação e uma visualização das pastas e arquivos do projeto. o usuário irá apenas ler então você deve preencher todas as informações necessárias para que o usuário consiga entender o funcionamento do projeto.`;

  const conteudo = await Gemini.sendGemini(promp + mk);

  existsSync('./inicioDocumentacao.mk') && unlinkSync('./inicioDocumentacao.mk');
  writeFileSync('./inicioDocumentacao.mk', conteudo);
}

await gerarDocumentacaoCompleta();
const markdownContent = readFileSync('./documentacao_final.mk', 'utf8');
await gerarInicioDocumentacao(markdownContent);

const markdownInicio = readFileSync('./inicioDocumentacao.mk', 'utf8');
const markdownDocumentcao = readFileSync('./documentacaoArquivos.mk', 'utf8');

existsSync('./documentacao_final.mk') && unlinkSync('./documentacao_final.mk');
writeFileSync('./documentacao_final.mk', markdownInicio + ' ' + markdownDocumentcao, 'utf8');

existsSync('./documentacao_final.pdf') && unlinkSync('./documentacao_final.pdf');
MarkdownPDF().from('./documentacao_final.mk').to('./documentacao_final.pdf', () => {
  console.log('Arquivo PDF gerado com sucesso!');
});

export default { readFilesRecursive };
