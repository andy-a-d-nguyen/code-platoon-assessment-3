const express = require('express');
const { Pool } = require('pg');
const app = express();
const port = 3001;

const pool = new Pool({
	connectionString: process.env.CONNECTION_STRING,
});

app.get('/data', function (_req, res) {
	pool.query('SELECT movie, hero from movie_hero', [], (err, result) => {
		if (err) {
			console.log(`BACKEND ERROR: ${err}`);
			return res.status(405).jsonp({
				error: err,
			});
		}

		result.rows.forEach((row) => console.log(JSON.stringify(row)));
		return res.status(200).jsonp({
			data: result.rows,
		});
	});
});

app.listen(port, () =>
	console.log(`Backend rest api listening on port ${port}!`)
);
