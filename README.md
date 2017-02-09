# WHV Slave

[Working Holiday Visa (WHV)](https://en.wikipedia.org/wiki/Working_holiday_visa) is a quite popular visa amongst youngsters who want to have a skip year before a real job/career.

The demand and offer are not matched quite very well, that's the reason why this app exists, for each of the WHV application, the app will be deployed to a AWS EC2 instance and the application process will be started at a given time (credit to [whenever](https://github.com/javan/whenever)), a [headless webdriver](https://rubygems.org/gems/selenium-webdriver) will drive the whole application.

## Features

- Easy to extend to other types of visas like [Silver Fern Visa (SFV)](https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/about-visa/silver-fern-job-search-work-visa)

- Open to extension of visa application task

- All the working instances will be bootstrapped/destroyed by [Rubber](https://github.com/rubber/rubber)