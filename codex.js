const fs = require('fs');
const path = require('path');
const gemini = require('./consultaGemini.js'); // Importa o módulo consultaGemini.js

const dirPath = process.argv[2];
if (!dirPath) {
    console.error('Informe o caminho.');
    process.exit(1);
}

fs.readdir(dirPath, async (err, files) => {
    if (err) {
        console.error('Erro ao ler o diretório:', err);
        return;
    }

    let allFiles = [];

    // Criar um array de promessas para processar os arquivos
    const filePromises = files.map(file => {
        return new Promise((resolve, reject) => {
            const filePath = path.join(dirPath, file);
            
            fs.stat(filePath, (err, stats) => {
                if (err) {
                    console.error(`Erro ao obter informações do arquivo ${file}:`, err);
                    return reject(err);
                }
                
                if (stats.isFile()) {
                    fs.readFile(filePath, 'utf8', async (err, data) => { 
                        if (err) {
                            console.error(`Erro ao ler o arquivo ${file}:`, err);
                            return reject(err);
                        }

                        try {
                            const result = await gemini.analysisFileContent(data);
                            let responseJson = result.replace('```json', '').replace('```', '');	
                            responseJson = JSON.parse(responseJson);
                            allFiles.push( { "nomeArquivo" : file, "contexto" : responseJson } );
                            resolve();
                        } catch (error) {
                            console.error(`Erro ao analisar o arquivo ${file}:`, error);
                            reject(error);
                        }
                    });
                } else {
                    resolve(); // Se não for arquivo, apenas resolver a Promise
                }
            });
        });
    });

    await Promise.all(filePromises);

    async function main() {
        if (allFiles.length > 0) {
            console.log("Arquivos processados:", allFiles);
            const markdown = await gemini.generateMd(JSON.stringify(allFiles));
            fs.writeFileSync('./teste.mk', markdown.slice(0,-3).slice(12));
        } else {
            console.log("Nenhum arquivo foi processado.");
        }
    }

    main();
});
