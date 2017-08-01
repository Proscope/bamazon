var mysql = require("mysql");
var prompt = require("prompt");
var cliTable = require("cli-table");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
	host: "localhost",
	port: 3306,

	user: "root",

	password: "",
	database: "bamazon"
});

//MAIN CHECK AND BUY FUNCTION WHICH DISPLAYS ALL ITEMS FROM MY SQL AND THEN ADDS FUNCTIONALITY TO BUY AN ITEM WITH QUANTITIY CHOICES. 
var checkAndBuy = function() {
    connection.query('SELECT * FROM products', function(err, res) {
        //CREATES A NEW TABLE IN THE COOL CLI VIEW 
        var table = new Table({
            head: ['ID', 'Product Name', 'Department', 'Price', 'Stock Quantity']
        });

        //DISPLAYS ALL ITEMS FOR SALE 
        console.log("HERE ARE ALL THE ITEMS AVAILABLE FOR SALE: ");
        console.log("===========================================");
        for (var i = 0; i < res.length; i++) {
            table.push([res[i].id, res[i].ProductName, res[i].DepartmentName, res[i].Price.toFixed(2), res[i].StockQuantity]);
        }
        console.log("-----------------------------------------------");
        //LOGS THE COOL TABLE WITH ITEMS IN FOR PURCHASE. 
        console.log(table.toString());
        inquirer.prompt([{
            name: "itemId",
            type: "input",
            message: "What is the item ID you would like to buy?",
            validate: function(value) {
                if (isNaN(value) == false) {
                    return true;
                } else {
                    return false;
                }
            }
        }, {
            name: "Quantity",
            type: "input",
            message: "How many of this item would you like to buy?",
            validate: function(value) {
                if (isNaN(value) == false) {
                    return true;
                } else {
                    return false;
                }
            }
        }]).then(function(answer) {
            var chosenId = answer.itemId - 1
            var chosenProduct = res[chosenId]
            var chosenQuantity = answer.Quantity
            if (chosenQuantity < res[chosenId].StockQuantity) {
                console.log("Your total for " + "(" + answer.Quantity + ")" + " - " + res[chosenId].ProductName + " is: " + res[chosenId].Price.toFixed(2) * chosenQuantity);
                connection.query("UPDATE products SET ? WHERE ?", [{
                    StockQuantity: res[chosenId].StockQuantity - chosenQuantity
                }, {
                    id: res[chosenId].id
                }], function(err, res) {
                    //console.log(err);
                    checkAndBuy();
                });

            } else {
                console.log("Sorry, insufficient Quanity at this time. All we have is " + res[chosenId].StockQuantity + " in our Inventory.");
                checkAndBuy();
            }
        });
    });
}


checkAndBuy();