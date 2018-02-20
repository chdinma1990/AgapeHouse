$amount = 0;

function showHide() {
    showHideDiv("payment_info")
    showHideDiv("user_info")
}
function showHideDiv(elementId) {
    // $("#payment_info").show();
    var element = document.getElementById(elementId);
    if (element.style.visibility == 'hidden')
    {
        element.style.visibility = 'visible';
    }
    else if (element.style.visibility == 'visible')
    {
        element.style.visibility = 'hidden';
    }
    window.scrollTo(0,0);
}

function calculateAmount(tithe, offering, missions, other){
  var t = parseFloat(tithe);
  var o = parseFloat(offering);
  var m = parseFloat(missions);
  var oth = parseFloat(other);
    $amount = (t + o + m + oth)*100;
    alert($amount);

}

function processForm() {
    var $form = $('#payment-form');
    $form.submit(function(event) {
        // Disable the submit button to prevent repeated clicks:
        $form.find('.submit').prop('disabled', true);
        alert("processForm");
        // Request a token from Stripe:
        Stripe.card.createToken($form, stripeResponseHandler(status, response));
        alert("processForm");
        // Prevent the form from being submitted:
        return false;
    });
};
function stripeResponseHandler(status, response) {
    // Grab the form:
    var $form = $('#payment-form');
    alert("stripeResponseHandler");
    alert("responce: "+response+"  status: " + status);

    if (response.error) { // Problem!
        alert(response);
        // Show the errors on the form:
        $form.find('.payment-errors').text(response.error.message);
        $form.find('.submit').prop('disabled', false); // Re-enable submission
        alert(response);

    }
    else { // Token was created!
        // Get the token ID:
        var token = response.id;

        // Insert the token ID into the form so it gets submitted to the server:
        $form.append($('<input type="hidden" name="stripeToken">').val(token));
        alert(response);
        // Submit the form:
        $form.get(0).submit();
    }
};

function validate(){

    var tithe = document.getElementById("tithe").value;
    var offering = document.getElementById("offering").value;
    var missions = document.getElementById("missions").value;
    var other = document.getElementById("other").value;
    var amount = parseFloat(tithe) + parseFloat(offering) + parseFloat(missions)  + parseFloat(other);

    // if(userFieldsUncompleted() || isNaN(amount) || amount < 0.5){
    //     alert("Please complete fields");
    //     event.preventDefault();
    //     return false;
    // }
    // return true;
    if(amount < 0.5){
        alert("Minimum sum amount charged against all givings categories is $0.5");
    }
}

function userFieldsUncompleted(){
    if ((!document.getElementById("gives_first_name").value) ||
        (!document.getElementById("gives_last_name").value) ||
        (!document.getElementById("gives_phone_number").value) ||
        (!document.getElementById("gives_address").value) ||
        (!document.getElementById("gives_city").value) ||
        (!document.getElementById("gives_state").value) ||
        (!document.getElementById("gives_zip").value) ||
        (!document.getElementById("gives_email").value)){
        return true;
    }else{
        return false;
    }
}

function totalDonationAmount(){
    var totalAmount = 0;

    if (document.getElementById("tithe").value){
        totalAmount += document.getElementById("tithe").value;
    }

    if (document.getElementById("offering").value){
        totalAmount += document.getElementById("offering").value;
    }

    if (document.getElementById("missions").value){
        totalAmount += document.getElementById("missions").value;
    }

    if (document.getElementById("other").value){
        totalAmount += document.getElementById("other").value;
    }

    return totalAmount;
}



/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}


