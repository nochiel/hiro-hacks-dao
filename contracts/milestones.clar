
;; title: milestone
;; version:
;; summary:
;; description:

;; traits
(impl-trait .extension-trait.extension-trait)
(use-trait milestone-trait .proposal-trait.milestone-trait)
;;

;; token definitions
;;

;; constants
;;

;; data vars
;;

;; data maps
(define-map proposals-with-milestones
    principal
    bool
)

;; Each proposal has many milestones.
;; @findout How do I nest maps in clarity?
(define-map milestones
    {proposal: principal, deadline: uint}
    {completed: bool, paid: bool}
)
;;

;; public functions
(define-private (add-milestone-iter (milestone {proposal: principal, deadline: uint}))
    (let
        (
            (proposal (get proposal milestone))
        )
        (map-insert milestones milestone {completed: false, paid: false})
        (map-insert proposals-with-milestones proposal true)
        (print {event: "add-milestones-to-proposal", proposal: proposal})
    )
)

(define-public (add-milestones-to-proposal
                    (proposal-milestones (list 4
                        {proposal: principal, deadline: uint})))
    (let
        (
            (result (map add-milestone-iter proposal-milestones))
        )
        (asserts! (> (len result) u0) (err  u1))
        (ok true)
    )
)

(define-public (set-completed-milestone (milestone {proposal: principal, deadline: uint}))
    (ok (map-set milestones milestone {completed: true, paid: false}) )
)

(define-public (pay-for-milestone (mile-stone {proposal: principal, deadline: uint}))
    ;; @todo Check the latest milestone (by blockheight).
    ;; @todo If the milestone is <= blockheight then execute the proposal.
    (let
        (
            (status (default-to {completed: false, paid: false}
                        (map-get? milestones mile-stone)))
            (proposal (get proposal mile-stone))
        )
        (if ;; (and (not (is-none proposal))
                (get completed status)
            (begin
                ;; (as-contract (contract-call? .proposal .pay-for-milestone (get deadline mile-stone)))
                (ok (map-set milestones {proposal: proposal, deadline: (get deadline mile-stone)} {completed: true, paid: true}))
            )
            (err u2)
        )
    )
)

(define-public (callback (sender principal) (memo (buff 34)))
  (ok true)
)
;;

;; read only functions
(define-read-only (does-proposal-have-milestones (proposal principal))
    (map-get? proposals-with-milestones proposal)
)
;;

;; private functions
;;

