/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function showhidePass() {
    var x = document.getElementById("MA_SApassword");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}
