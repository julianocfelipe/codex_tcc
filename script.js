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
//const caminhoDaPasta = 'C:\\Users\\Rafae\\OneDrive\\Documentos\\Projetos\\projeto-integrador-ia-main'
//const caminhoDaPasta = 'C:\\Users\\Rafae\\OneDrive\\Documentos\\Projetos\\mattermost-master';
const arquivos = readFilesRecursive(caminhoDaPasta);

  // const conteudoMK = await Gemini.generatMkWithJson(JSON.stringify(arquivos, null, 2))
  // writeFileSync('./kkkk.mk', conteudoMK.replace('```markdown', ''));
  // console.log('Arquivo gerado com sucesso!');

  export default { readFilesRecursive };