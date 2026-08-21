function showIncome() {

    document.getElementById("display").innerHTML = `

        <div class="page-header">
            <h3>New Income</h3>
            <p>Record a new income</p>
        </div>

        <div class="form-container" >

            <label>Income Name</label>
            <input type="text" placeholder="e.g. Salary">

            <label>Amount</label>
            <input type="number" placeholder="R0.00">

            <label>Category</label>
            <select>
                <option>Select Category</option>
                <option>Salary</option>
                <option>Allowance</option>
                <option>Business</option>
                <option>Other</option>
            </select>
             <label>Account</label>
            <select>
                <option>Select Account</option>
                <option>Salary</option>
                <option>Allowance</option>
                <option>Business</option>
                <option>Other</option>
            </select>

            <label>Date</label>
            <input type="date">

            <label>Description</label>
            <textarea placeholder="Enter description"></textarea>

            <button class="save-button">Save Income</button>

        </div>
    `;
}
function showExpenses() {

    document.getElementById("display").innerHTML = `

        <div class="page-header">
            <h3>New Expense</h3>
            <p>Record a new expense</p>
        </div>

        <div class="form-container">

            <label>Expense Name</label>
            <input type="text" placeholder="e.g. Groceries">

            <label>Amount</label>
            <input type="number" placeholder="R0.00">

            <label>Category</label>
            <select>
                <option>Select Category</option>
                <option>Food</option>
                <option>Transport</option>
                <option>Entertainment</option>
                <option>Bills</option>
                <option>Other</option>
            </select>

            <label>Date</label>
            <input type="date">

            <label>Description</label>
            <textarea placeholder="Enter description"></textarea>

            <button class="save-button">Save Expense</button>

        </div>
    `;
}
addEventListener()
function showAccounts(){
    document.getElementById("display").innerHTML =`
    
      <h3>Accounts</h3>
      <button class="save-button" onClick="addAccount()">Add Account</button>
      <button class="save-button" onClick="deleteAccount()">Delete Account</button>
      <button class="save-button" onClick="updateAccount()">Update Account name</button><br><br>
      <div class="form-container" id = "currentAccounts">
        
        <div class="page-header">
            <h3>Current Accounts</h3>
            <table>

                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Type</th>
                        <th>Current Balance</th>
                        
                    </tr>
                </thead>

                <tbody>

                    <tr>
                        <td>Capitec</td>
                        <td>Savings</td>
                        <td>R5,000.00</td>
                        
                    </tr>

                    <tr>
                        <td>FNB</td>
                        <td>Cheque</td>
                        <td>R8,500.00</td>
                       
                    </tr>

                    <tr>
                        <td>Standard Bank</td>
                        <td>Savings</td>
                        <td>R3,200.00</td>
                        
                    </tr>

                </tbody>

            </table>
        </div>
      </div>
    `;
}
function addAccount(){
  document.getElementById("currentAccounts").innerHTML = `
  <div class="page-header">
            <h3>Add Account</h3> </div> 
           <label>Account type</label>
            <select>
                <option>Cheque</option>
                <option>Savings</option>
                <option > Notice</option>
                <option > Other> </ option>
               
            </select><br><br>
             <label>Balance</label>
            <input type="number" placeholder="R0.00">
             <label>Account Name</label>
            <input type="text" placeholder="e.g. Big Bank">
            <button class="save-button"> Add to my Account </button>

  `;
}
function deleteAccount(){
  document.getElementById("currentAccounts").innerHTML = `
  <div class="page-header">
            <h3>Delete Account</h3> </div> 
           <label>Account </label>
            <select>
                <option>Cheque</option>
                <option>Savings</option>
                <option > Notice</option>
                <option > Other> </ option>
               
            </select><br><br>
             
            <button class="save-button"> Delete Account </button>

  `;
}
function updateAccount(){
  document.getElementById("currentAccounts").innerHTML = `
  <div class="page-header">
            <h3>Update Account Name </h3> </div> 
           <label>Account </label>
            <select>
                <option>Cheque</option>
                <option>Savings</option>
                <option > Notice</option>
                <option > Other> </ option>
               
            </select><br><br>
             <label>Account Name</label>
            <input type="text" placeholder="e.g. Big Bank">
            <button class="save-button"> Update Account Name </button>

  `;
}
function showTransfer() {

    document.getElementById("display").innerHTML = `

        <div class="page-header">
            <h3>New Transfer</h3>
            <p>Transfer money between accounts</p>
        </div>

        <div class="form-container">

            <label>From Account</label>
            <select>
                <option>Select Account</option>
                <option>Capitec</option>
                <option>FNB</option>
            </select><br>
 
           <br><br> <label>To Account</label>
            <select>
                <option>Select Account</option>
                <option>Capitec</option>
                <option>FNB</option>
            </select>

            <label>Amount</label>
            <input type="number" placeholder="R0.00">

            <label>Date</label>
            <input type="date">

            <label>Description</label>
            <textarea placeholder="Enter description"></textarea>

            <button class="save-button">Save Transfer</button>

        </div>
    `;
}