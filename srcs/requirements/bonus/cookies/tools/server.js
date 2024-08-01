const http = require("http")
const fs = require('fs');

http.createServer(function (req, res) {
	var url = req.url;
	if (url.length == 0 || url[url.length - 1] == "/")
		url += "index.html";
	if (url[0] != "/")
		url = "/" + url;
	url = process.cwd() + url;

	res.writeHead(200);
	var stream = fs.createReadStream(url);
	stream.on('error', (err) => {
		res.writeHead(404);
		res.write("404 not found");
		res.end();
	})
	stream.pipe(res);
}).listen(8080);
