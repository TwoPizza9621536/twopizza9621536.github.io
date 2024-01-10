---
title: Reasons Why Non Fungible Tokens Are Scams
date: 2023-07-21 10:31:02 -0400
categories:
  - Technology
tags:
  - Cryptocurrency
  - Cryptography
description: >-
  Or how NFTs is not an actual tangible asset that can be unique once.
---

Non Fungible Tokens or NFTs in recent months have been a very controversial
technology not just in the tech world but also in the art world.<!-- more -->
I know I am going to get flamed by tech bros on how "Web3" will change the world
and how people will actually own digital property, but in actuality it is a way
for scammers to gain more money.

<p class="message notice">
  <span class="message-title">{% octicon info height:24 %} Notice</span>
  <br>
  This article was still in draft during 2022. I did not finish this as many
  other people have voice their options on NFTs. But since this article is
  mostly finished, I have rewritten this article for a less wordy explanation.
</p>

## How NFTs Works

First off, what are NFTs?

> NFTs is a unique and non-interchangeable unit of data stored on a blockchain,
> a form of digital ledger.
> \- [Wikipedia][1]

Basically a receipt or transaction "proves" that you have a digital asset, which
cannot be copied and records it in a blockchain. Then how do you create a NFT,
well below is a simple diagram that I have created to show the process.

![Starting with a digital asset, next minting the asset, then putting the NFT on
  the blockchain.]({% asset_path nft_process.svg %} "Process of Minting a NFT")

Ok, that diagram does not contain the important process of creating NFTs, how
minting NFTs work. The process of minting is complicated, as it uses a technique
hashing. Hashing is a process where you take the binary representation of a
digital file and through the use of an "one way" algorithm to create a hash, a
representation of the binary file. Then the hash is used to create NFTs. And
thats why can people can copy assets that are minted as NFTs. Because you are
getting the NFTs that represent the asset, a hash, not the original digital
asset which and be copied.

## How NFTs Ruined Cryptocurrency

NFTs require the use of cryptocurrency to give it value, where the transactions
are logged in a blockchain which seems like a good idea as the blockchain tracks
who owns which NFTs. But theres a catch, transactions are not reversible and
wallets are anonymous, this allow scammers to get away with stealing money while
leaving people with NFTs which are effectively worthless when a value of
cryptocurrency falls, and scammers cashing out.

This has farther ruined the reputation of cryptocurrencies, right behind
cryptocurrency scams itself. But cryptocurrencies does a real legitimate uses
like anonymous donations to protect the donator. Yes, it can be used for
criminal acts but it is about how the technology used, not the existent of the
technology. But that is an other day.

## Conclusion

There is another "crypto" I want to talk about, cryptography. Cryptography is
the technology that allows us to communicate through the internet securely,
encryption, and cryptocurrencies including NFTs which I alluded to with hashing.
Hashing is used to check the integrity of a file, is the file you got is the
actual file. Hashing does not prevent if the file has been injected with
malware, so we introduce signing. Signing check both integrity and authenticity
of the file, *but* not ownership because you can copy the file without the
signature. Cryptocurrency did have future, yet it has fallen to wasteland of
greed.

*[NFTs]: Non Fungible Tokens

[1]: https://en.wikipedia.org/wiki/Non-fungible_token
