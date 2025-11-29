# AWS IoT Core Module

このモジュールは、ESP32などのIoTデバイスをAWS IoT Coreに接続するために必要なリソースを作成します。

## 作成されるリソース

- **AWS IoT Thing**: IoTデバイスの論理的な表現
- **AWS IoT Policy**: デバイスがIoT Coreに接続し、Pub/Subを行うためのポリシー
- **AWS IoT Certificate**: デバイス認証用の証明書
- **Policy Attachment**: 証明書にポリシーをアタッチ
- **Thing Principal Attachment**: ThingとCertificateの関連付け

## 使用方法

```hcl
module "iot_core" {
  source = "../../modules/iot-core"

  thing_name = "esp32-device-01"
  
  tags = {
    Environment = "dev"
    Project     = "agritech"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| thing_name | Name of the IoT Thing | `string` | n/a | yes |
| tags | Tags to apply to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| iot_thing_name | Name of the IoT Thing |
| iot_thing_arn | ARN of the IoT Thing |
| certificate_arn | ARN of the IoT certificate |
| certificate_pem | Device certificate in PEM format (sensitive) |
| private_key | Private key for the certificate (sensitive) |
| public_key | Public key for the certificate (sensitive) |
| iot_endpoint | AWS IoT Core endpoint address |

## ESP32への接続方法

1. モジュール適用後、以下のコマンドで証明書を取得:
```bash
terraform output -raw certificate_pem > device_cert.pem
terraform output -raw private_key > private_key.pem
terraform output iot_endpoint
```

2. AmazonRootCA1をダウンロード:
```bash
curl -o AmazonRootCA1.pem https://www.amazontrust.com/repository/AmazonRootCA1.pem
```

3. ESP32のコードに証明書とエンドポイントを設定してMQTT接続

## 注意事項

- 証明書と秘密鍵は機密情報です。Git等にコミットしないでください
- IoT Policyは現在`resources = ["*"]`で全リソースへのアクセスを許可していますが、本番環境では適切に制限してください
