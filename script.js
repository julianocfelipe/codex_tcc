import fs from 'fs';
import path from 'path';
import { generatMkWithJson } from './LLM/Gemini/Gemini.js'; // Usando import

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
    const items = fs.readdirSync(currentPath);

    for (const item of items) {
      const fullPath = path.join(currentPath, item);
      const stats = fs.statSync(fullPath);

      if (stats.isDirectory()) {
        readDir(fullPath); // recursivamente lê a subpasta
      } else if (stats.isFile()) {
        const ext = path.extname(fullPath).toLowerCase();

        if (extensoesPermitidas.includes(ext)) {
          const content = fs.readFileSync(fullPath, 'utf-8');
          result.push({
            name: path.relative(dirPath, fullPath),
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

const arquivos = readFilesRecursive(caminhoDaPasta);
console.log(JSON.stringify(arquivos, null, 2));

  const conteudoMK = await generatMkWithJson(JSON.stringify(arquivos, null, 2))
  fs.writeFileSync('./kkkk.mk', conteudoMK.replace('```markdown', ''));
  console.log('Arquivo gerado com sucesso!');

