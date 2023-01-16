db = db.getSiblingDB("london");


printjson(db.taxi_rides.aggregate([
    {
        "$match": { "data.json": { "$ne": null } }
    },
    {
        "$group": {
            "_id": "$driver_id",
            avgRating: { $avg: {"rating"} }
        }
    },
    {
        "$orderby": { avgRating : -1 }
    },
    {
        "$limit": 100
    }
], { allowDiskUse: true }));
