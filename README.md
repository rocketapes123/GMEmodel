# GMEmodel
A model to try to predict GME closing prices

Well, basically just a linear model with some Monte-Carlo-Optimization regarding the coefficients as described here in German:
https://www.reddit.com/r/Spielstopp/comments/ne9vhn/neues_kursmodell_zur_vorhersage_für_euch_zum/

This of course is not financial or investment advise. No, seriously not.

Variable Explanation:
- Date: Date.
- Weekday: 1 = Monday, 5 = Friday
- Sett: Day to or from settlement for SI reports as described here: https://www.reddit.com/r/Superstonk/comments/nc1lny/ive_estimated_the_current_si_based_on_the_si/ with 0 on all days except 1 to 2 days prior to the date, where the variable is 1
- VolumeGME: Volume of trades (Source: Webull) - not used in model
- Volume1HPM: Volume of trades first hour premarket (Webull)
- Return1H: Stock price movement in first hour of premarket (Webull)
- ReturnGME: Stock price movement whole day (close to close, Webull)
- ReturnSPY: PREVIOUS Day S&P Return in percent (Webull)
- FTD: FTD Cycle (T+21) as described by hank etc. - T+21 theory
- Beta 3M: PREVIOUS Day GME Beta of the last 3 months 
- Beta4W: PREVIOUS Day GME Beta of the last 4 weeks
- Beta2W: PREVIOUS Day GME Beta of the last 2 weeks
- Beta1W: PREVIOUS Day GME Beta of the last week
- BTC: PREVIOUS Day BTC movement in percent (yahoo finance)
- MaxPain: Change of Max Pain price compared to previous day, measured at 4am CET via swaggystocks.com
- RGME_PD: PREVIOUS Day Return of GME (time lag T-1)
- RAMC_PD:  PREVIOUS Day Return of AMC (time lag T-1)
- ReturnAMPD: Stock price movement of GME in Aftermarkt of previous trading day (Webull)
- RCTweetPD: Has Ryan Cohen tweeted yesterday? (0, 1)
- RSIPD: Daily RSI at the end of the previous day (Webull)
- SP1H: Return of first hour Premarket Trading S&P
- AMC1H: Return first hour trading AMC
- MACDHISPD: Daily MACD Histogram value at the end of previous trading day (Webull)
- mPlastPrice: Difference of current max pain price to the GME price at the end of the previous trading day in percent (swaggystocks)
