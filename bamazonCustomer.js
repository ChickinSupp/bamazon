const inquirer = require('inquirer');
const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '',
    database: 'bamazon_db'
});

connection.connect(err => {
    if (err) throw err;
    startMenu();
});

const startMenu = () => {
    connection.query('SELECT * FROM products', (err,res) => {
        if (err) throw err;
        if (res.length > 0) {
            console.log(`Welcome to Bamazon! \n 
            ${______________________________________}`);
            console.log('Here are our products...');
            for (let i=0; i<res.length; i++) {
                console.log(`Item ID: ${res[i].item_id} || Name: ${res[i].product_name} || Price: ${res[i].price}`);
            }
            console.log('\n')

            inquirer.prompt([
                {
                    name: 'units',
                    type: 'input',
                    message: 'How many untis would you like to purchase?'
            }]).then(answer => {
                let id = parseInt(answer.ItemID);
                let units = parseInt(answer.units);

                if (isNaN(id) || (id > res.length)) {
                    console.log('Please enter a valid ID number');
                } else {
                    console.log('You\'re in');
                    transaction(id, units);
                }
            });
        } else {
            console.log('Server is down for maintenance. PLease try again later.');
        }
    });
};

const transaction = (id,units) => {
    let query = `SELECT product_name,price,stock_quantity, FROM products WHERE item_id = ${id}`;
    connection.query(query, (err,res) => {
        if (err) throw err;
        console.log(res);

        if (units <= res[0].stock_quantity){
            let newQuantity = res[0].stock_quantity - units;
            let orderPrice = res[0].price * units;
            let product = res[0].product_name;

            connection.query(
                'UPDATE products SET ? WHERE ?',
                [
                    {
                        stock_quantity: newQuantity
                    },
                    {
                        item_id: id
                    }
                ],
                err => {
                    if (err) {
                        throw err
                    } else {
                        console.log(`\nPurchase Complete!\nThank you for your purchase of ${units} units of ${product}.\nYour total cost for this purchase is $${orderPrice}\n____________________________\n`);
                        setTimeout(() => {
                            startMenu();
                        }, 1500);
                    }
                }
            );
        } else {
            console.log('Insufficient quantity! \n Check back later.\n__________________________________________________________________\n');
            startMenu();
        }
    });
};