function makeid(length)
{
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < length; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    return text;
}

var port = '80';

module.exports = {
	db: 'phyloviz',
	databaseUserString: 'phyloviz:phyloviz', //Database user
	randomId: makeid,
	title: "PHYLOViZ Online",
	email: '-', //email for job link submission
	spe: '-', //email pass
	cipherUser: {
		algorithm: 'aes-256-ctr',
		pass: 'passwordCipher' //select one cipher
	},
	currentRoot: 'http://localhost:' + String(port) + '/',
	//certPath: 'my.crt',
	//keyPath: 'my.key',
	port: port,
	maxComparisons: 800000000,
	maxNumberOfNodes: 10000,
	batchSize: 200,
	token_secret: 'phyloviz_auth_secret', //secret for autentication
	final_root: 'http://localhost',
    postgresHost: "db_phyloviz"
}