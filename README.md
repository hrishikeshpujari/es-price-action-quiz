# ES · Price Action · Daily Quiz

A browser-based quiz that fetches a real 5-minute chart for any ticker on any completed trading day and asks you Al Brooks-style price action questions generated on the fly by Claude.

**Live:** https://hrishikeshpujari.github.io/es-price-action-quiz/

## What it does

- **Real charts.** Loads 5-minute OHLC bars from Polygon.io for any ticker (SPY, QQQ, AAPL, ES futures, etc.) on any completed trading day, with 9 EMA and 20 EMA overlays.
- **AI-generated questions.** Claude (Anthropic API) reads the chart and writes a fresh price-action question every time — so you can't memorize answers.
- **Al Brooks methodology.** Questions span market structure, signal bars, entry setups, trade management, and context reading. Difficulty is selectable: beginner, intermediate, advanced, or mixed.
- **Streak + accuracy tracking.** Running score and streak persist in the browser.

## Quick start

1. Grab both API keys (detailed steps below).
2. Open https://hrishikeshpujari.github.io/es-price-action-quiz/ (or run locally — see below).
3. Paste keys into the setup panel → pick a ticker + date → **Load Chart** → **New Question**.

## Getting the API keys

You need two, both with free options.

| Provider | Used for | Free tier |
|---|---|---|
| [Anthropic](https://console.anthropic.com) | Generates the quiz questions | Pay-as-you-go credits (min $5) |
| [Polygon.io](https://polygon.io/dashboard/signup) | 5-min OHLC chart data | Free, no credit card |

### 1. Anthropic (for Claude-generated questions)

1. Go to https://console.anthropic.com and sign up (Google or email).
2. **Billing** → **Buy credits**. **Minimum purchase is $5**; see the cost breakdown below for how long that lasts.
3. **Limits** (left sidebar) → set a **Monthly spend limit**. A cap of $5–$10 is reasonable — it's a safety net so a leaked key can't drain your balance.
4. **API keys** → **Create key** → name it (e.g. `price-action-quiz`) → **Copy**. The key starts with `sk-ant-api03-…` and is only shown once.
5. Paste into the **Anthropic API Key** field in the app's setup panel.

#### How much credit do I need?

The quiz uses **Claude Sonnet 4** (text only, no image input — it reads the bar data as numbers). Rough cost per question:

| Call part | Tokens | Rate | Cost |
|---|---|---|---|
| System prompt + bar data (input) | ~1,700 | $3 / 1M | $0.0051 |
| Generated question (output) | ~700 | $15 / 1M | $0.0105 |
| **Per question** | | | **~$0.015** (≈1.5¢) |

**So $5 gets you roughly 300 questions** — enough for weeks of daily practice. You don't need more than the $5 minimum to start.

> A single practice session is typically 5–20 questions = ~$0.08–$0.30. Even heavy daily use (say, 50 questions/day) runs about $0.75/day, or ~$22/month. Set your monthly cap accordingly.

### 2. Polygon.io (for 5-min chart data)

1. Go to https://polygon.io/dashboard/signup and create an account. **No credit card required** for the free tier.
2. Verify your email.
3. Dashboard → **Keys** (left sidebar) → copy the default API key shown there.
4. Paste into the **Polygon.io API Key** field in the app's setup panel.

#### Polygon free-tier caveats

- **~15-minute end-of-day delay** plus a **2-day lag on historical data** — so to load today's or yesterday's chart you'll typically need to wait. Pick a date from **2+ trading days ago** to be safe (e.g. if today is Monday, Thursday of last week is a safe choice).
- **5 API calls per minute** limit — more than enough for this quiz, which makes one call per chart load.

## Running it yourself

### Hosted (easiest)

Just use https://hrishikeshpujari.github.io/es-price-action-quiz/. No setup needed.

### Deploy your own copy to GitHub Pages

1. Sign in to https://github.com and **Fork** this repo (https://github.com/hrishikeshpujari/es-price-action-quiz).
2. In your fork: **Settings** → **Pages** → Source: `Deploy from a branch` / Branch: `main` / folder `/ (root)` → **Save**.
3. Wait ~30–60 seconds. Your copy will be live at `https://<your-username>.github.io/es-price-action-quiz/`.

> The fork must be **public** for free-plan GitHub Pages. The repo contains no secrets — keys live in your browser only.

### Local

- **macOS / Linux:** `bash launch-quiz.sh` (or double-click it). Opens `http://localhost:8765/`.
- **Windows:** double-click `launch-quiz-windows.bat`.
- **Anywhere with Python 3:** `python3 -m http.server 8765` from this folder, then open `http://localhost:8765/`.

## Using the app

- On first load, paste both keys into the setup panel and click **Save & Start**.
- Pick a ticker + date → **Load Chart**.
- Pick a question type (market structure, signal bar, entry setup, trade management, context reading — or all) + difficulty (beginner / intermediate / advanced / mixed) → **New Question**.
- Answer, get feedback, repeat. Score + streak persist in your browser.

## Security notes

- **Keys live in your browser only.** Stored in `localStorage`; never sent anywhere except to Anthropic and Polygon directly.
- **Client-side API calls are visible in DevTools.** For personal use this is fine. If you're hosting this publicly under your own key, set a monthly spend limit in the [Anthropic console](https://console.anthropic.com) so a leaked key can't drain your balance.
- **The repo contains no secrets.** Each visitor enters their own keys.

## Disclaimer

Educational tool. The quiz is for practicing pattern recognition on historical charts — it's **not trading advice** and past setups don't imply future ones.

## License

MIT
