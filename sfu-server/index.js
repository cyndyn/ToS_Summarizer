const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const fs = require('fs');
const jsonParser = bodyParser.json();

// accept t&c text
app.post('/upload', jsonParser, (req, res) => {
    var spawn = require('child_process').spawn,
        py = spawn('python3', ['summarize.py', req.body.keyword]),
        textData = req.body.text,
        dataString = '';

    console.log(textData);
    py.stdout.on('data', function(data){
        dataString += data.toString();
    });
    py.stderr.on('data', function(data) {
        console.log('Error');
        console.log(data.toString());
    });
    py.stdout.on('end', function(){
        console.log('summary text:',dataString);
        res.send(dataString);
    });
    py.stdin.write(textData);
    py.stdin.end();
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server started on port ${PORT}`));
