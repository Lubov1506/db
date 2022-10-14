const {Client} = require('pg')
const config = {
    user: 'postgres',
    password: '1506',
    host: 'localhost',
    database: 'mydb',
    port: '5432'
}
const client = new Client(config)
start();

const users = [{
    firstName: 'john',
    lastName: 'Doe',
    emali: 'iygh@gmakui.dov',
    birthday: '1995/06/06',
    gender: 'male',
    height: 1.23,
    isSubscribe: false
},
{
    firstName: 'johtyn',
    lastName: 'Doute',
    emali: 'iygh@gmakui.dov',
    birthday: '1995/06/06',
    gender: 'male',
    height: 1.23,
    isSubscribe: false
},
{
    firstName: 'jodrthn',
    lastName: 'Dozsdte',
    emali: 'iygh@gmakui.dov',
    birthday: '1995/06/06',
    gender: 'male',
    height: 1.23,
    isSubscribe: false
},
{
    firstName: 'jhjkjohn',
    lastName: 'Dojtte',
    emali: 'iygh@gmakui.dov',
    birthday: '1995/06/06',
    gender: 'male',
    height: 1.23,
    isSubscribe: false
}

]
async function start () {
    await client.connect();
    const res = await client.query(`
    INSERT INTO "users"(
        "first_name",
        "last_name",
        "email",
        "gender",
        "birthday",
        "height",
        "issubsribe"
    ) VALUES ${mapUsers(users)}`);
    console.log(res);

    await client.end()
}

function mapUsers (users) {
    return users.map(u=>{
        return `(
           '${u.firstName}', '${u.lastName}', '${u.email}','${u.gender}','${u.birthday}','${u.height}','${u.isSubscribe}'
        )`
    }).join(',')
}

console.log(mapUsers(users));