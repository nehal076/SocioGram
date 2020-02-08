/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function checkURL(website) {
    var string = website.value;
    if (!~string.indexOf("http")) {
        string = "http://" + string;
    }
    website.value = string;
    return website
}