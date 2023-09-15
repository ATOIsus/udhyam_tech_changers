require('dotenv').config()           
const portRoute = process.env.PORT

//Importing routes.
const user_routes = require('./routes/user-routes')
const supplier_routes = require('./routes/supplier-routes')

//const { verifyUser, verifySupplier } = require('../middlewares/authentication-middleware')

//Creating an object.
const mongoose = require("mongoose")

//Connecting to database.
mongoose.connect('mongodb://127.0.0.1:27017/showjal')  
        .then(() => console.log("Connected to Mongo database."))
        .catch((err) => console.log(err))


const express = require('express')

//Creating an object.
const app = express()

app.listen(portRoute, () =>{
    console.log(`Server is running in ${portRoute}`)  
 })

//Using routes from another file
app.use('/api/user', user_routes)
app.use('/api/supplier', supplier_routes)

//Unknown Path.
app.use((req, res) => {
    res.status(404).json({error : "Path Not Found"})
})
