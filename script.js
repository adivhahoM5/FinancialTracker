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