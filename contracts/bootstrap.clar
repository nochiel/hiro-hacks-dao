
;; title: bootstrap
;; version:
;; summary:
;; description:

;; traits
;;

;; token definitions
;;

;; constants
(define-constant ERR_CHALLENGE_FAILED (err u4000))
;;

;; data vars
;;

;; data maps
;;

;; public functions
(define-public (challenge-initial-token-allocation)

    (begin
        ;; (as-contract (contract-call? .core execute .initial-token-allocation tx-sender)))
        (contract-call? .core construct .initial-token-allocation)
    )
)

(define-public (challenge-make-grants-proposal)

    ;; Create Grant Proposals: After initializing your grants program, the next step is to create grant proposals. This involves using the propose function in the proposal-submission contract. This function allows anyone to propose a grant, which will then be voted on by the token holders. The proposal includes details such as the title, description, and the proposal contract. Once a proposal is submitted, it can be voted on during the voting period defined by the proposal-duration parameter.

    (contract-call? .proposal-submission propose
                    .grant-proposal
                    "Challenge: Create Grant Proposals"
                    u"Solution to https://docs.hiro.so/hacks/build-a-decentralized-grants-program#challenges" )

)

(define-public (bootstrap)
    (begin
            ;; Add challenge extensions.
            ;; @note Only self-or-extension can set-extension
            ;; (unwrap! (contract-call? .core set-extension .initial-token-allocation true) (err ERR_CHALLENGE_FAILED))
            ;; (unwrap! (contract-call? .core set-extension .grant-proposal true) (err ERR_CHALLENGE_FAILED))

            ;; Run challenges.
            (unwrap! (challenge-initial-token-allocation)
                    (err ERR_CHALLENGE_FAILED))
            (unwrap! (challenge-make-grants-proposal)
                    (err ERR_CHALLENGE_FAILED))
            (ok true)
        )
)

;; private functions
;;
