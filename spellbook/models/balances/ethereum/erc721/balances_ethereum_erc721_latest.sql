{{ config(
        alias='erc721_latest'
        )
}}
SELECT
    wallet_address,
    token_address,
    tokenId,
    nft_tokens.name as collection,
    nft_tokens.category as category,
    updated_at
FROM {{ ref('transfers_ethereum_erc721_rolling_hour') }}
LEFT JOIN {{ ref('tokens_ethereum_nft') }} nft_tokens ON nft_tokens.contract_address = token_address
