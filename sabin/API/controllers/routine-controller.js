//For /api/user/info
const getRoutine = (req, res, next) => {
  res.json({
    data: [
      {
        day: "Sunday",
        startTime: "9:00",
        endTime: "11:00",
        location: "Dili bazar",
        source: "Source1",
      },

      {
        day: "Tuesday",
        startTime: "14:00",
        endTime: "17:00",
        location: "Dili bazar",
        source: "Source1",
      },

      {
        day: "Thursday",
        startTime: "2:00",
        endTime: "5:00",
        location: "Dili bazar",
        source: "Source1",
      },

      {
        day: "Tuesday",
        startTime: "1:00",
        endTime: "3:00",
        location: "Naya Baneshwor",
        source: "Source3",
      },

      {
        day: "Wednesday",
        startTime: "22:00",
        endTime: "24:00",
        location: "Naya Baneshwor",
        source: "Source3",
      },

      {
        day: "Thursday",
        startTime: "5:00",
        endTime: "6:00",
        location: "Naya Baneshwor",
        source: "Source3",
      },
    ],
  });
};

module.exports = {
  getRoutine,
};
