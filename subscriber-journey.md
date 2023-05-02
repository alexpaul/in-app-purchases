# Subscriber Journey 

* Retention: `active`, auto-renewal is off.
  * Possible action: Resubscribe UI can be presented
* Billing Retry:  `expired`, expired in billing retry. 
  * Possible action: Banner to deep-link to update their payment information in Subscription management
* Grace Period: `expired`, expired in grace period
  * Possible action: a presented sheet showing the countdown to subscription days remaining, and a link to Subscription management
* Winback: `expired`, expired from billing
  * Possible action: Use a Push Notification merchandising a current winback marketing offer. Deep link from Push Notification to the landing page.
* Upgrade: `active`, auto renew on. User has made multiple monthly purchases. 
  * Possible action: Discount on yearly subscription.


## Resources 

* [Architecting for subscriptions - WWDC20](https://developer.apple.com/videos/play/wwdc2020/10671/)
