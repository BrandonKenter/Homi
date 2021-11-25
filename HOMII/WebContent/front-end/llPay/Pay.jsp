<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Payment System</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Badger Bank">
    <meta name="author" content="Matthew Maurice">
    <!-- <link rel="stylesheet" href="styles.css"> -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    
    <style>
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');

</style>
    
</head>
<body>
<jsp:include page="/front_header.jsp"/>
	<br>
            <br>
            <h2 style="text-align:center">Welcome to your payment portal!</h2>  
            
            <br>
            <p style="text-align:center">Select Tenant</p>
            <div class="dropdown" style="text-align:center">
              <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Tenant
              </button>
              <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <a class="dropdown-item" href="#">Something else here</a>
              </div>
            </div>
            <br>
            <h3 style="text-align:center">Current Balance</h2>
            <p id="balance" style="text-align:center">38.92</p>


            <!--Pick Action-->
            <div style="text-align:center" onchange="landlordTypeSelect()">
              <div class="form-check form-check-inline" >
                <input class="form-check-input" type="radio" name="llRadio" id="llPenaltyRadio" formaction="javascript:landlordPenaltySelect();">
                <label class="form-check-label" for="flexRadioDefault1">
                  Penalty
                </label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="llRadio" id="llPaymentRadio" checked formaction="javascript:landlordPaymentSelect();">
                <label class="form-check-label" for="flexRadioDefault2">
                  Payment
                </label>
              </div>
            </div>
          
            <!--
          <p>Enter Credit Card Info:</p>
          <input style="margin-bottom: 10px" id="CreditCardInfo" type="text"></input>
            -->

          <!-- Payment -->
          <div id = "llPaymentForm" style="text-align:center">
            <p>Enter Amount:</p>
            <input style="margin-bottom: 10px" id="amountPaid" type="text"></input>

            <form>
              <button type="submit" formaction='javascript:landlordAddPayment();' style="margin-bottom: 10px" class = "btn">Add to Balance</button>
            </form>
          </div>

          <!-- Penalty -->
          <div id = "llPenaltyForm" style="text-align:center; visibility:hidden">
            <p>Enter Amount:</p>
            <input style="margin-bottom: 10px" id="penaltyAmount" type="text"></input>
            <form>
              <button type="submit" formaction='javascript:landlordAddPenalty();' style="margin-bottom: 10px" class = "btn">Add Penalty</button>
            </form>
          </div>
	
	<script>
	
		function landlordAddPayment() {
	
		    var curBal = document.getElementById("balance").innerHTML;
	
		    var paymentAmnt = document.getElementById("amountPaid").value;
	
		    // Displays errors if input is not a number, or is empty
			if (isNaN(paymentAmnt) || paymentAmnt.length == 0){
				console.log("Invalid Value");	
			}
			// Displays the new balance
			else {
				document.getElementById("balance").innerHTML = curBal - paymentAmnt;
			}   
		}
		
		function landlordAddPenalty() {

		    var curBal = document.getElementById("balance").innerHTML;

		    var penaltyAmnt = document.getElementById("penaltyAmount").value;

		    // Displays errors if input is not a number, or is empty
			if (isNaN(penaltyAmnt) || penaltyAmnt.length == 0){
				console.log("Invalid Value");	
			}
			// Displays the new balance
			else {
				newBal = parseFloat(curBal)+parseFloat(penaltyAmnt);
		        console.log(newBal);

		        document.getElementById("balance").innerHTML = newBal;
			}
		}
	
		function landlordTypeSelect() {
		    //console.log("PaymentOutter");
		    if ($("#llPaymentRadio").is(":checked")) {
		        //console.log("Payment");
		        document.getElementById("llPaymentForm").style.visibility = "visible";
		        document.getElementById("llPenaltyForm").style.visibility = "hidden";
		    }
		    if ($("#llPenaltyRadio").is(":checked")) {
		        //console.log("Payment");
		        document.getElementById("llPenaltyForm").style.visibility = "visible";
		        document.getElementById("llPaymentForm").style.visibility = "hidden";
		    }
		    // document.getElementById("llPaymentForm").style.visibility = "visible";
		    // document.getElementById("llPenaltyForm").style.visibility = "hidden";
		}
	
	
	</script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
</body>
</html>
