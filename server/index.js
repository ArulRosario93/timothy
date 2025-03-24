const express = require("express");
const functions = require("firebase-functions");
const axios = require("axios");
const admin = require("firebase-admin");
const http = require("http");


// const ws = require("ws")
// const WSS = new ws.Server({ port: 8080 });

admin.initializeApp();

const app = express();
const server = http.createServer(app);

const socketio = require("socket.io")(server);
// const io = new Server(server);

require('dotenv').config();

app.get("/", (req, res) => {
    res.send("This is Home Page");
});

app.get("/auth/spotify/details", async (req, res) => {

    const code = req.query.code;
    const URL = process.eventNames.URL;

    const clientID = process.env.CLIENTID;
    const clientSecret = process.env.CLIENTSECRET;
    const redirectURL = process.env.REDIRECTURL;

    try {

        // Get Access Token

        const tokenResponse = await axios.post(URL, null, {
            params: {
                grant_type: "authorization_code",
                code,
                redirect_uri: redirectURL,
                client_id: clientID,
                client_secret: clientSecret,
            },
            headers: { "Content-Type": "application/x-www-form-urlencoded" }
        });

        console.log("First Reponse");
        console.log("First Reponse");
        console.log(tokenResponse);

        const access_token = tokenResponse.data.access_token;
        // const refresh_token = tokenResponse.data.refresh_token;

        // With Access Token get user data

        const userResponse = await axios.get(process.env.SPOTIFYME, {
            headers: { Authorization: `Bearer ${access_token}` },
        });

        const spotifyUser = userResponse.data;
        
        console.log("DATAAAAAA");
        console.log(spotifyUser);
    } catch (error) {
        console.log("ERROR MAA");
        console.log("ERROR MAA");
        console.log(error);
    }
});

app.get('/auth/spotify/currentsong', async (req, res) => {

    const access_token = req.body.access_token;

    try {
        
        const response = await axios.get(process.env.CURRENTSONGAPI, {
            headers: {
                "Authorization": `Bearer ${access_token}`
            }
        });

        if(response.status == 200 && response.data){
            const song = response.data.item;

            console.log("Edho song playing mama");
            res.send(`Song Playing Guyss. It's ${song.name} by ${song.artists.map(artist => artist.name).join(", ")}`,);
        }

    } catch (error) {
        
        if (error.response && error.response.status === 401) {
            console.log("🔑 Access token expired! Refreshing token...");
            await refreshAccessToken();
        } else {
            console.error("Error fetching currently playing song:", error.response ? error.response.data : error.message);

            res.send("refreshaccesstoken");
        }
    }
});

// Function to refresh access token (example implementation)
async function refreshAccessToken(refresh_token) {
    // You need to store the refresh token securely (e.g., in a database or environment variable)

    try {
        const response = await axios.post("https://accounts.spotify.com/api/token", new URLSearchParams({
            grant_type: "refresh_token",
            refresh_token: refresh_token,
            client_id: "your-client-id", // Replace with your client ID
            client_secret: "your-client-secret" // Replace with your client secret
        }), {
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            }
        });

        const newAccessToken = response.data.access_token;
        console.log("✅ New Access Token:", newAccessToken);

        // Store this new access token securely and use it for future requests.
        return newAccessToken;
    } catch (error) {
        console.error("❌ Failed to refresh token:", error.response ? error.response.data : error.message);
    }
}

app.get("/auth/spotify/refreshtoken", async (req, res) => {

    const refresh_token = req.body.refresh_token;
    const access_token = refreshAccessToken(refresh_token);

    try {
        
        const response = axios.get("https://api.spotify.com/v1/me/player/currently-playing", {
            headers: {
                "Authorization": `Bearer ${access_token}`
            }
        });

        if(response.status == 200 && response.data){
            const song = response.data.item;

            console.log(`Song Playing Guyss. It's ${song.name} by ${song.artists.map(artist => artist.name).join(", ")}`,);
        }

    } catch (error) {
    
        console.error("Error fetching currently playing song:", error.response ? error.response.data : error.message);
    
    }
});

// io.on("connection", (socket) => {
//     console.log("Logging in");
//     console.log("Client connected:", socket.id);
  
    // socket.on("message", (message) => {
    //   console.log("Received message:", message);
    //   io.emit("message", `Server: ${message}`); // Broadcast to all clients
    // });
  
    // socket.on("disconnect", () => {
    //   console.log("Client disconnected:", socket.id);
    // });
// });

socketio.on('connection', (userSocket) => {
    
    console.log("CONNECTED I GUESS");

    userSocket.on("joinRoom", (data) => {
        userSocket.join(data);

        console.log("User Joined Room ", data);
    });

    userSocket.on('message', (data) => {

        const { roomID, message } = data;

        socketio.to(roomID).emit('newMessage', message);
        console.log("MEssage Emitted from server to socket");     
    })
});

// WSS.on('connection', ws => {
//     console.log("CONNECTED");

//     ws.send("HOW YOU DOINNG", )

//     ws.on("message", msg => {

//         console.log("Server recieved msg ", msg);

//         ws.send("Ithan vangiko");

//     })
// });

server.listen(process.env.PORT, () => {
    console.log("Successfully running on port ", process.env.PORT);
});
