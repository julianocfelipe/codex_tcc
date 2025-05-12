import { readFilesRecursive } from './script.js';

const caminhoDaPasta = 'C:\\Users\\Rafae\\OneDrive\\Documentos\\Projetos\\devconnector_2.0-master'; 
//const caminhoDaPasta = 'C:\\Users\\Rafae\\OneDrive\\Documentos\\Projetos\\projeto-integrador-ia-main'
//const caminhoDaPasta = 'C:\\Users\\Rafae\\OneDrive\\Documentos\\Projetos\\mattermost-master';
const arquivos = readFilesRecursive(caminhoDaPasta);