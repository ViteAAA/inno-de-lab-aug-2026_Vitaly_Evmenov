raw_transactions = ["SUCCESS:100", "FAILED:50", "SUCCESS:-10", "SUCCESS:0", "SUCCESS:250", "ERROR:200"]

success_transactions = [
    int(transaction.split(":", 1)[1]) for transaction in raw_transactions
    if "SUCCESS" in transaction
]

success_transactions = [transaction for transaction in success_transactions if transaction > 0]
print(success_transactions)