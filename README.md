# ES · Price Action · Daily Quiz

A browser-based quiz that fetches a real 5-minute chart for any ticker on any completed trading day and asks you Al Brooks-style price action questions generated on the fly by Claude.

**Live:** https://hrishikeshpujari.github.io/es-price-action-quiz/

## What it does

- **Real charts.** Loads 5-minute OHLC bars from Polygon.io for any ticker (SPY, QQQ, AAPL, ES futures, etc.) on any completed trading day, with 9 EMA and 20 EMA overlays.
- **AI-generated questions.** Claude (Anthropic API) reads the chart and writes a fresh price-action question every time — so you can't memorize answers.
- **Al Brooks methodology.** Questions span market structure, signal bars, entry setups, trade management, and context reading. Difficulty is selectable: beginner, intermediate, advanced, or mixed.
- **Streak + accuracy tracking.** Running score and streak persist in the browser.

## Getting started

### 1. Get API keys (both free)

| Provider | Used for | Free tier |
|---|---|---|
| [Anthropic](https://console.anthropic.com) | Generates the quiz questions | Pay-as-you-go credits |
| [Polygon.io](https://polygon.io/dashboard/signup) | 5-min OHLC chart data | Free, no credit card |

> **Polygon free tier has a ~2-day lag**, so pick a date from a couple of trading days ago (not today or yesterday).

### 2. Open the app

**Hosted:** https://hrishikeshpujari.github.io/es-price-action-quiz/

**Local:**
- **macOS / Linux:** `bash launch-quiz.sh` (or double-click it). Opens `http://localhost:8765/`.
- **Windows:** double-click `launch-quiz-windows.bat`.
- **Anywhere with Python 3:** `python3 -m http.server 8765` from this folder, then open `http://localhost:8765/`.

### 3. Paste your keys, pick a chart, start quizzing

- On first load, paste both keys into the setup panel.
- Pick a ticker + date → **Load Chart**.
- Pick a question type + difficulty → **New Question**.
- Answer, get feedback, repeat.

## Security notes

- **Keys live in your browser only.** Stored in `localStorage`; never sent anywhere except to Anthropic and Polygon directly.
- **Client-side API calls are visible in DevTools.** For personal use this is fine. If you're hosting this publicly under your own key, set a monthly spend limit in the [Anthropic console](https://console.anthropic.com) so a leaked key can't drain your balance.
- **The repo contains no secrets.** Each visitor enters their own keys.

## Disclaimer

Educational tool. The quiz is for practicing pattern recognition on historical charts — it's **not trading advice** and past setups don't imply future ones.

## License

MIT
