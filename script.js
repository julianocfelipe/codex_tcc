import { readdirSync, statSync, readFileSync, writeFileSync } from 'fs';
import { join, extname, relative } from 'path';
//import { generatMkWithJson } from './LLM/Gemini/Gemini.js'; 
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
        readDir(fullPath); // recursivamente lê a subpasta
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

// Exemplo de uso:
const caminhoDaPasta = 'C:\\Users\\Rafae\\OneDrive\\Documentos\\Projetos\\devconnector_2.0-master';
const arquivos = readFilesRecursive(caminhoDaPasta);

// Lista de arquivos a ignorar
const arquivosIgnorados = [
  'package.json', 'package-lock.json', 'yarn.lock',
  'README.md', 'readme.md', 'tsconfig.json', 'manifest.json'
];

// Limpa ou inicia o arquivo final
writeFileSync('./documentacao_final.mk', '');

for (const arquivo of arquivos) {
  const nome = arquivo.name.toLowerCase();

  // Ignorar arquivos irrelevantes
  if (arquivosIgnorados.some(f => nome.endsWith(f))) {
    console.log(`Ignorando: ${arquivo.name}`);
    continue;
  }

  console.log(`Processando: ${arquivo.name}`);
  const jsonArquivo = JSON.stringify([arquivo], null, 2);
const promptBase = `Gere o conteúdo de um arquivo Markdown para a documentação técnica de um projeto. O Markdown deve incluir: 
- Código-fonte relevante (sem comentários);
- Tabelas para métodos, se aplicável;
- Estrutura clara com títulos.`  
  const conteudoParcial = await Gemini.generatMkWithJson(promptBase, JSON.stringify([arquivo], null, 2), 0.3);

  if (conteudoParcial) {
    writeFileSync(
      './documentacao_final.mk',
      `\n## Documentação: ${arquivo.name}\n\n${conteudoParcial}\n`,
      { flag: 'a' }
    );
  } else {
    console.warn(`Falha ao gerar documentação para ${arquivo.name}`);
  }
}

console.log('Documentação completa gerada em documentacao_final.mk');


  export default { readFilesRecursive };