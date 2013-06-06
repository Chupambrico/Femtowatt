<script src="js/md5.js"></script>
<script>
function psw(){
   var val=document.getElementById("a").value
   document.write(val)
    document.getElementById("p").innetHTML= hex_md5(val);
    document.write(val)
}  

</script>
<input type="text" id="input"/>
<input type="text" id="hash"/>

 <input type="button" onclick="document.getElementById('hash').value = hex_md5(document.getElementById('input').value)" value="MD5">
<div id="p"></div>