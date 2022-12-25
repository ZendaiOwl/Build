async function formSubmit(event) {
	const username = document.querySelector('#username').value;
	const password = document.querySelector('#password').value;
	const postID = document.querySelector('#postID').value;
	const msg = {
		method: 'POST',
		headers: {
			'Accept':'application/json',
			'Content-Type':'application/json',
			'X-API-Key': 'Q2i8dMuJ_YBQQyjU9Y8PJCtcL8dXuzLhCPVkuyL6N'
		},
		body: JSON.stringify({
			key: 		username.toLowerCase(),
			username:	username.toLowerCase(),
			password:	password,
			postID:		postID
		})
	};
	const resJSON = await getData(msg);
	const res_output = document.querySelector('#res');
	res_output.textContent = "";
	res_output.innerHTML += "Response data: " + JSON.stringify(resJSON) + "<br><br>";
	res_output.innerHTML += "Key: " + resJSON.key + "<br>";
	res_output.innerHTML += "Username: " + resJSON.username + "<br>";
	res_output.innerHTML += "Password: " + resJSON.password + "<br>";
	res_output.innerHTML += "Post ID: " + resJSON.postID + "<br>";
	event.preventDefault();
}
async function getData(msg_body) {
	const response = await fetch("https://gdaekv.deta.dev/data", msg_body);
	const data = await response.json();
	return data
}
