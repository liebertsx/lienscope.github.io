const { exec } = require('child_process');

function runShellCommand(command) {
    exec(command, (error, stdout, stderr) => {
        if (error) {
            console.error(`Error: ${error.message}`);
            return;
        }
        if (stderr) {
            console.error(`stderr: ${stderr}`);
            return;
        }
        console.log(`stdout: ${stdout}`);
    });
}

document.getElementById('runCommandButton').addEventListener('click', () => {
    const command = 'lua obfuscator.lua ';
    runShellCommand(command);
});

document.getElementById('fileUpload').addEventListener('change', (event) => {
    const file = event.target.files[0];
    console.log('Uploaded file:', file);
      const command = `lua obfuscator.lua ${file} obfuscated`;
    runShellCommand(command);
});
