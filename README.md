
Here on this address you can find video walkthrough for Dapp

   
[UNICEFDapp](https://www.youtube.com/watch?v=yh1T1yDjMlM)



## React front-end

1. clone repo

    `git clone https://github.com/ilijapet/UNICEFfrontend`

2. Install dependencies

    `npm isntall  --legacy-peer-deps`

3. Create .env in React project root folder with following values

    `REACT_APP_HOST=http://localhost:3000
    REACT_APP_BACKEND_HOST=http://127.0.0.1:8000
    REACT_APP_CONTRACTADDRESS=0x1fA99bB28cc817aAc2B5D35bE56c0121DAdC8E0F
    REACT_APP_WALLETCONNECT_PROJECT_ID=here_put_your_wallet_connect_id`

4. Run development server

    `npm start`


## Smart contracts

1. clone repo

    `git clone https://github.com/ilijapet/UNICEFsmartcontracts`

2. Install Foundry. Check for instruciton on following link

    `https://book.getfoundry.sh/getting-started/installation`

3. run tests

    `forge test`

You should see something like this:

    [⠊] Compiling...
    [⠰] Compiling 31 files with 0.8.20
    [⠒] Solc 0.8.20 finished in 4.38sCompiler run successful!
    [⠑] Solc 0.8.20 finished in 4.38s

    Running 2 tests for test/Donation.t.sol:ContractBTest
    [PASS] testClaimUnicefCoins() (gas: 59338)
    [PASS] testDonate() (gas: 36720)
    Test result: ok. 2 passed; 0 failed; 0 skipped; finished in 4.50ms


## Django Backend

1. clone repo

    `git clone https://github.com/ilijapet/UNICEFbackend`

2. Install Docker

    `https://docs.docker.com/get-docker/`


3. Install Gunicorn 

    `https://docs.gunicorn.org/en/stable/install.html`

4. Install Postgres

    `https://www.postgresql.org/download/`


5. Install Poetry

    `https://python-poetry.org/docs/#installation`


6. Activate environment from backend root directory

    `poetry shell`


7. Make migrations

    `make migrations`

8. Run postgres from root

    `make up-dependencies-only`


9. If you don't have make in root of UNICEFbackend tow new folders with following files

    `/var/log/gunicorn/dev.log`
    `/var/run/gunicorn/dev.pid
`

10. In separate terminal (same folder) run Gunicorn

   `make gunicorn-dev`


Now you should be able to use Dapp locally!



