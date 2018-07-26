from iexfinance import get_historical_data
from datetime import datetime
import pandas as pd

start_date='2016-01-01'
end_date='2017-01-01'
start_date = pd.to_datetime(start_date)
end_date = pd.to_datetime(end_date)

data = get_historical_data(
    'aapl', start=start_date, end=end_date, output_format='pandas')

data.close.plot()
plt.show()
