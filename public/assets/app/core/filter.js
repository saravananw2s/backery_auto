self.addEventListener("message", function(e) {
  var multisearch = e.data.multisearch;
  var datatable = e.data.datatable;
  var smart = e.data.smart;
  setTimeout(function() {
    for (var j = 0; j < multisearch.length; j++) { //for every filter
      if (multisearch[j].ident) { //check if filter exists
        for (var i = datatable.data.length - 1; i >= 0; i--) { //for every row
          var removeRow = true; //take a guess
          for (var key in datatable.data[i]) { //for every property
            if (datatable.data[i].hasOwnProperty(key)) { //check if propery exitst
              if (key == multisearch[j].column) { //check if filter is current column
                var op = false; //check for operators
                for (var key in operators) {
                  if (multisearch[j].ident.split(" ")[0] == key) {
                    op = true; //operator found
                  }
                }
                if (op) { //if operator was found
                  var msray = multisearch[j].ident.split(" ");
                  var operator = multisearch[j].ident.split(" ")[0];
                  msray.splice(0, 1); //extract operator
                  var comp = msray.join(" "); //and rest
                  if (operators[operator](datatable.data[i][multisearch[j].column], comp)) {
                    removeRow = false; //check operator condition
                    break;
                  }
                }
                else {
                  if (matchRule(datatable.data[i][multisearch[j].column], multisearch[j].ident, smart)) {
                    removeRow = false; //check string and filter
                    break;
                  }
                }
              }
            }
          }
          if (removeRow) {
            datatable.data.splice(i, 1); //remove the row
          }
        }
      }
    }
    postMessage(datatable);
  }, 600); //your userinput delay
}, false);

function matchRule(str, rule, smart) {
  str = String(str);
  rule = String(rule);
  if (smart) {
    rule = "*" + rule.toLowerCase() + "*";
    str = str.toLowerCase();
  }
  return new RegExp("^" + rule.split("*").join(".*") + "$").test(str);
};

//some other functions
var operators = {
    '<': function(a, b) { return a < b },
    '<=': function(a, b) { return a <= b },
    '!=': function(a, b) { return a != b },
    '==': function(a, b) { return a == b },
    '>=': function(a, b) { return a >= b },
    '>': function(a, b) { return a > b }
};