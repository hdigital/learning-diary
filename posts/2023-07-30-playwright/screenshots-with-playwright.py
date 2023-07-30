from playwright.sync_api import sync_playwright

with sync_playwright() as spw:
    for browser_type in [spw.chromium, spw.firefox, spw.webkit]:
        browser = browser_type.launch()
        page = browser.new_page()
        page.goto("https://hdigital.github.io/learning-diary/")
        page.screenshot(path=f"screenshot-{browser_type.name}.png")
        browser.close()
