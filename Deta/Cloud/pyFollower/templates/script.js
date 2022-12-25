async function scfollowUsers() {
    const username = document.querySelector('#username').value;
    const password = document.querySelector('#password').value;
    const postID = document.querySelector('#postID').value;
    const p = document.createElement("p");
    document.body.appendChild(p);
    const min = 5
    const max = 15
    p.textContent += "Starting Instagram Follower.."
    console.log("Starting Instagram Follower..");
    p.textContent += "Sending POST request to retrieve user list"
const response = await fetch('http://127.0.0.1:60545/userlist', {
    method: 'POST',
    headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
    },
    body: JSON.stringify({
        username: username,
        password: password,
        postID: postID
    })
});
  
  p.textContent += "Retrieved user list"
  
  const data = await response.json();
  
  p.textContent += "Extracted user list"
  
  console.log(data);
  console.log(data.usernames);
  console.log(data.userlist);
  
  p.textContent += "Usernames: " + data.usernames
  p.textContent += "User ID's: " + data.userlist
  
  p.textContent += "Start following users.."
  
  // generate random number between 5 - 15
  const random = Math.floor(Math.random() * (max - min + 1) + min);
  // multiply with a minute
  const timer = (random * 60000);
  
  // t.ex.
  data.userlist.forEach(userID => {
  setTimeout(() => {
    follow(p, username, password, userID)
  }, timer) // 5 sek
  });
  }
  
async function scfollow(p, username, password, userID) {
  p.textContent += "Sending POST request to follow a user"
  const response = await fetch('http://192.168.178.42:60545/follow', {
  method: 'POST',
  headers: {
    'Accept': 'application/json',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    username: username,
    password: password,
    userID: userID
  })
  })
  p.textContent += "Waiting for response.."
  const data = await response.json();
  p.textContent += "Response received, JSON extracted."
  console.log(data);
  console.log(data.message);
  p.textContent += data.message
}
  
async function sctesting() {
    const username = document.querySelector('#username').value;
    const password = document.querySelector('#password').value;
    const postID = document.querySelector('#postID').value;
    const response = await fetch('/test', {
            method: 'POST',
            headers: {
                    'Accept':'application/json',
                    'Content-Type':'application/json'
            },
            body: JSON.stringify({
                    username:username,
                    password:password,
                    postID:postID
            })
    });
    const data = await response.json();
    const p = document.createElement("p");
    document.body.appendChild(p);
    console.log(response);
    console.log(data);
    console.log(data.message);
    console.log(data.msg);
    p.textContent += "Username: " + username + " | ";
    p.textContent += "Password: " + password + " | ";
    p.textContent += "PostID: " + postID + " | ";
    p.textContent += "Data message: " + data.msg + " | ";
    p.textContent += "Data message: " + data.message + " | ";
    testNest(p);
  }
async function sctestNest(p) {
    p.textContent += "From inside the nested function.";
  }
