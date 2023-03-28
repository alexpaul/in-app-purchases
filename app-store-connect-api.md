# App Store Connect API

[The App Store Connect API](https://developer.apple.com/documentation/appstoreconnectapi) is a REST API that enables the automation of actions you take in App Store Connect. Click OpenAPI specification to download the specification file.
Calls to the API require JSON Web Tokens (JWT) for authorization; you obtain keys to create the tokens from your organization’s App Store Connect account. See Creating API Keys for App Store Connect API to create your keys and tokens.

> The App Store Connect API is for internal development, testing, and reporting purposes
within your team only, and lets you automate key parts of your own internal workflow.

* TestFlight. Managing beta builds of your app, testers, and groups.
* Users and Access. Sending invitations for users to join your team, adjusting user
permissions, and removing users.
* Reporting. Downloading sales and financial reports for your app.

![Screen Shot 2023-03-27 at 4 00 02 PM](https://user-images.githubusercontent.com/1819208/228053359-e957a244-2435-4388-869c-df4c34bbd352.png)

## Making Requests 

If you attempt to make a request without a signed JWT this will be the response.   
e.g endpoint: `https://api.appstoreconnect.apple.com/v1/apps/{id}/inAppPurchasesV2`

```json
{
    "errors": [
        {
            "status": "401",
            "code": "NOT_AUTHORIZED",
            "title": "Authentication credentials are missing or invalid.",
            "detail": "Provide a properly configured and signed bearer token, and make sure that it has not expired. Learn more about Generating Tokens for API Requests https://developer.apple.com/go/?id=api-generating-tokens"
        }
    ]
}
```

## Generate a JSON Web Token (JWT)

> [Apple docs:](https://developer.apple.com/documentation/appstoreconnectapi/generating_tokens_for_api_requests) JSON Web Token (JWT) is an open standard (RFC 7519) that defines a way to securely transmit information. The App Store Connect API requires JWTs to authorize each API request. You create the token, signing it with the private key you downloaded from App Store Connect.

You can use [jwt.io](https://jwt.io/) or the following Python script: 

```python
import datetime

from authlib.jose import jwt

def main():
    header = {
        'alg': 'ES256',
        'kid': 'YOUR ID HERE',
        'typ': 'JWT'
    }

    payload = {
        'iss': 'YOUR ID HERE',
        'aud': 'appstoreconnect-v1',
        'exp': int(datetime.datetime.now().timestamp()) + 1200 
    }
    # token good for 20 min, as per https://developer.apple.com/go/?id=api-generating-tokens

    key = open('AuthKey-YOURAUTHKEYHERE.p8', 'r').read()
    token = jwt.encode(header, payload, key).decode('utf-8')

    print(token)
    # now you can make API requests using this generated token

if __name__ == '__main__':
    main()
```

[Getting started with Python and VSCode](https://code.visualstudio.com/docs/python/python-tutorial#_install-visual-studio-code-and-the-python-extension)

## Some Useful Endpoints 

* GET `https://api.appstoreconnect.apple.com/v1/apps`: Find and list apps in App Store Connect.
* GET `https://api.appstoreconnect.apple.com/v1/apps/{id}/inAppPurchasesV2`: Get a list of the in-app purchases for a specific app.


## Resources

> App Store Connect API: In-App Purchases and Subscriptions. Manage in-app purchases and auto-renewable subscriptions for your app.

* [Apple docs: App Store Connect API - Automate the tasks you perform on the Apple Developer website and in App Store Connect.](https://developer.apple.com/documentation/appstoreconnectapi)
* [Apple docs: App Store API Collection - Manage all aspects of your app, App Clips, in-app purchases, and customer reviews in the App Store.](https://developer.apple.com/documentation/appstoreconnectapi/app_store)
* [Apple docs: Creating API Keys for App Store Connect API](https://developer.apple.com/documentation/appstoreconnectapi/creating_api_keys_for_app_store_connect_api)
* [Apple docs: Generating Tokens for API Requests - Create JSON Web Tokens signed with your private key to authorize API requests.](https://developer.apple.com/documentation/appstoreconnectapi/generating_tokens_for_api_requests)
* [Apple docs: Auto-Renewable Subscriptions - Create and manage auto-renewable subscriptions, including managing subscription groups and submissions for review.](https://developer.apple.com/documentation/appstoreconnectapi/app_store/auto-renewable_subscriptions)
* [Apple docs: Subscription Introductory Offers - Create, modify, and delete introductory offers for auto-renewable subscriptions.](https://developer.apple.com/documentation/appstoreconnectapi/app_store/auto-renewable_subscriptions/subscription_introductory_offers)
