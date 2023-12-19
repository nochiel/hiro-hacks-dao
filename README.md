# README

This repository contains a work-in-progress implementation of the ["Build a Decentralized Grants Program"](https://docs.hiro.so/hacks/build-a-decentralized-grants-program) challenge for the [Hiro Hacks] series.

## Getting Started

To get the application running, follow these steps:

0. Clone the repository: `git clone https://github.com/nochiel/hiro-hacks-template.git`
1. Navigate into the directory: `cd hiro-hacks-template`
2. Use node LTS `nvm install -lts`
3. Install the dependencies: `yarn install`
4. Start the development server: `yarn dev`

To test the contracts, use `clarinet console`.

Ensure you have a Stacks Wallet app (e.g. [Leather Wallet](https://leather.io/install-extension)) installed in your browser and set its network to `devnet`.

## Roadmap

> The deadline to submit is Wednesday, December 13th at midnight ET.

Once again I only had 6 hours to work on this and so I barely got anything done. Most of my time was spent working on Clarity examples and reading the Clarity Book. 😭

The challenges to be done are:

- [x] Enable extensions in `construct`.
- [x] Distribute initial token allocation.
- [x] Create Grant Proposals.
- [x] Implement Milestone-Based funding.
- [ ] UI Integration.
