const User = require("../models/user");

//For /api/user/info
const getRequests = (req, res, next) => {
  User.find()
    .then((user) => {
      if (!user) {
        res.status(404).json({ error: "No user found!" });
      }

      lstRequest = [];
      nonEmptyList = [];
      userRequestList = [];

      user.forEach((singleUser) => lstRequest.push(singleUser.waterRequest));

      lstRequest.forEach((lst) => {
        if (lst.length > 0) {
          nonEmptyList.push(lst);
        }
      });

      nonEmptyList.forEach((lst) => {
        User.findOne({ _id: lst.user }).then( (user) =>{
            userRequestList.push(
                {
                    contactNumber : user.contactNumber,
                    price : lst.price

                }
            )
        }
         

        )
      });

      console.log(nonEmptyList);

      res.json({ data: request });
    })
    .catch(next);
};

module.exports = {
  getRequests,
};
