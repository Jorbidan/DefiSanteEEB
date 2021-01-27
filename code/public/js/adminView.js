$(window).on('load', function () {
    document.getElementById("adminSend").addEventListener("click", AdminCheck);
});

function AdminCheck(){
    var adminpassword = document.getElementById("adminPassword");
    if (cyrb53(adminpassword.value) == 5044877491544788) {
        document.getElementById("test").hidden = false;
        document.getElementById("AdminCheck").hidden = true;

    }
    else{
        console.log("wrong password");
    }
}

//hashing
const cyrb53 = function(str, seed = 0) {
    let h1 = 0xdeadbeef ^ seed, h2 = 0x41c6ce57 ^ seed;
    for (let i = 0, ch; i < str.length; i++) {
        ch = str.charCodeAt(i);
        h1 = Math.imul(h1 ^ ch, 2654435761);
        h2 = Math.imul(h2 ^ ch, 1597334677);
    }
    h1 = Math.imul(h1 ^ (h1>>>16), 2246822507) ^ Math.imul(h2 ^ (h2>>>13), 3266489909);
    h2 = Math.imul(h2 ^ (h2>>>16), 2246822507) ^ Math.imul(h1 ^ (h1>>>13), 3266489909);
    return 4294967296 * (2097151 & h2) + (h1>>>0);
};