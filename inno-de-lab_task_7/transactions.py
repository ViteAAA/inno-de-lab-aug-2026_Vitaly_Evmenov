# initialize data
raw_transactions = ["SUCCESS:100", "FAILED:50", "SUCCESS:-10", "SUCCESS:0", "SUCCESS:250", "ERROR:200"]

# get only correct success transactions
success_transactions = [int(transaction.split(":")[1]) for transaction in raw_transactions if int(transaction.split(":")[1]) > 0 and "SUCCESS" in transaction]

# print result data
print(f"Очищенные транзакции: {success_transactions}")