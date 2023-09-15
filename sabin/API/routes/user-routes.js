const express = require('express')
const router = express.Router()



router.route('/')
    .get(userController.getAllUsers)

    .post((req, res, next) => {
        res.status(405).json({ error: "POST request is not allowed!" })
    })

    .put((req, res, next) => {
        res.status(405).json({ error: "PUT request is not allowed!" })
    })

    .delete((req, res, next) => {
        res.status(405).json({ error: "DELETE request is not allowed!" })
    })

router.route('/signup')
    //Add new user.
    .post(userController.signUpUser)

    .get((req, res, next) => {
        res.status(405).json({ error: "GET request is not allowed!" })
    })

    .put((req, res, next) => {
        res.status(405).json({ error: "PUT request is not allowed!" })
    })

    .delete((req, res, next) => {
        res.status(405).json({ error: "DELETE request is not allowed!" })
    })


router.route('/signin')
    // User login (for both user and admin).
    .post(userController.signInUser)

    .get((req, res, next) => {
        res.status(405).json({ error: "GET request is not allowed!" })
    })

    .put((req, res, next) => {
        res.status(405).json({ error: "PUT request is not allowed!" })
    })

    .delete((req, res, next) => {
        res.status(405).json({ error: "DELETE request is not allowed!" })
    })


router.route('/info')
    //Get, update and delete information of specific user.
    .get(verifyUser, userController.getSingleUser)

    .put(verifyUser, userController.updateUserDetails)

    .delete(verifyUser, userController.deleteUser)

    .post((req, res, next) => {
        res.status(405).json({ error: "POST request is not allowed!" })
    })


router.route('/requestwater')
    //Update password.
    .post(verifyUser, userController.requestWater)

    .get((req, res, next) => {
        res.status(405).json({ error: "GET request is not allowed!" })
    })

    .put((req, res, next) => {
        res.status(405).json({ error: "PUT request is not allowed!" })
    })

    .delete((req, res, next) => {
        res.status(405).json({ error: "DELETE request is not allowed!" })
    })


module.exports = router