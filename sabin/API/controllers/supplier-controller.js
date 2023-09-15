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
      separateLst = [];
      userRequestList = [];
      filteredList = [];
      finalList = [];

      user.forEach((singleUser) => lstRequest.push(singleUser.waterRequest));

      lstRequest.forEach((lst) => {
        if (lst.length > 0) {
          nonEmptyList.push(lst);
        }
      });

      nonEmptyList.forEach((lst) => {
        lst.forEach((individualLst) => {
          separateLst.push(individualLst);
        });
      });

      separateLst.forEach((lst) => {
        filteredList.push({
          user: lst.user,
          price: lst.price,
          accept: lst.accept,
        });
      });

      filteredList.forEach((indUser) => {
        User.findById(indUser.user).then((result) => {
            finalList.push({
               contactNumber: result.contactNumber,
               price: indUser.price
            })
        });
      });

      console.log(finalList)

      //res.json({ data: separateLst });
    })
    .catch(next);
};

module.exports = {
  getRequests,
};
