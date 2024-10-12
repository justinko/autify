# README

Run the Dockerfile:

```
cd autify
docker build -t autify-justin-ko .
docker run -p 3000:3000 --name autify-justin-ko autify-justin-ko
```

To create an assertion:

```
curl -H "Content-type: application/json" -d '{"url": "google.com", "text": "foo"}' 'http://localhost:3000/api/v1/assertions'
```
