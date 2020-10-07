import pandas as pd
import os
import datetime
from iexfinance.stocks import get_historical_data
import plotly.graph_objects as go

start = datetime.datetime.now() - datetime.timedelta(days=5)
# Public API key
api_key = ""

syms = ["SPY"]
df = get_historical_data("SPY", output_format='pandas', token=api_key,
                         start=start, end=datetime.datetime.now())


fig = go.Figure(data=[go.Candlestick(x=df.index,
                open=df['open'],
                high=df['high'],
                low=df['low'],
                close=df['close'])])
fig.update_layout(
    title='SPY YTD',
    yaxis_title='SPY Price')

fig.show()