# Helmet Extended Chart

이 차트는 기존 [helmet](https://github.com/companyinfo/helm-charts/blob/main/charts/helmet) 차트를 확장하여 `StatefulSet` 배포를 지원하고 추가적인 기능을 제공하는 라이브러리 차트입니다. `helmet` 차트의 모든 기능을 상속받으면서, 유연성을 더해 복잡한 애플리케이션 배포를 간소화하는 것을 목표로 합니다.

## 주요 특징

- **`StatefulSet` 지원**: `values.yaml`에서 `kind: StatefulSet` 설정을 통해 손쉽게 `StatefulSet`으로 배포할 수 있습니다.
- **기존 `helmet` 기능 완벽 호환**: `Deployment`, `Service`, `Ingress`, `HPA`, `ConfigMap`, `Secret` 등 `helmet`이 제공하는 모든 기능을 그대로 사용할 수 있습니다.
- **라이브러리 차트**: 단독으로 배포되지 않으며, 다른 애플리케이션 차트의 `sub-chart`로 포함되어 재사용성을 극대화합니다.
- **유연한 설정**: `values.yaml`을 통해 쿠버네티스 리소스의 거의 모든 속성을 상세하게 제어할 수 있습니다.

## 전제 조건

- Kubernetes 1.19+
- Helm 3.2.0+

## 설치 및 사용법

이 차트는 라이브러리 차트이므로 직접 설치할 수 없습니다. 다른 애플��케이션 차트의 `sub-chart`로 사용해야 합니다.

1.  **`Chart.yaml`에 의존성 추가**

    사용하려는 애플리케이션 차트의 `Chart.yaml` 파일에 다음과 같이 `dependencies`를 추가합니다.

    ```yaml
    # Chart.yaml
    apiVersion: v2
    name: my-application
    version: 0.1.0
    appVersion: "1.0.0"

    dependencies:
      - name: helmet-extended
        version: "0.1.0" # 사용하려는 helmet-extended 차트 버전
        repository: "file://path/to/helmet-extended" # 로컬 경로 또는 차트 저장소 URL
    ```

2.  **`values.yaml` 설정**

    애플리케이션 차트의 `values.yaml`에서 `helmet-extended`의 `exports.defaults`에 정의된 키(예: `kind`)를 사용하여 설정을 재정의합니다.

    **예시: Deployment로 배포 (기본값)**

    ```yaml
    # values.yaml
    kind: Deployment

    **예시: StatefulSet으로 배포**

    ```yaml
    # values.yaml
    kind: StatefulSet
    ```

3.  **템플릿 렌더링**

    애플리케이션 차트의 `templates` 디렉토리에서 `helmet-extended`를 호출하여 리소스를 렌더링합니다.

    ```yaml
    # `templates/app.yaml` 예시
    {{ include "aift-helmet.app" . }}
    ```

## 추가 설정값 (Configuration)

`helmet-extended`는 `helmet` 차트의 모든 설정값을 상속받습니다. 전체 설정 목록은 `values.yaml` 파일 또는 `charts/helmet/README.md` 를 참고하십시오.

### 배포 설정

| 파라미터                      | 설명                                                                                             | 기본값          |
| ----------------------------- | ------------------------------------------------------------------------------------------------ | --------------- |
| `kind`                        | 배포할 워크로드의 종류를 선택합니다. (`Deployment` 또는 `StatefulSet`)                           | `Deployment`    |

### 별도 리소스 를 위한 파라미터 (CR 등)

| Name                              | Description                                                            | Value   |
|-----------------------------------|------------------------------------------------------------------------|---------|
| `extraList`                       | 별도 리소스 리스트                                                     | `[]`    |



## 라이선스

이 차트는 원본 `helmet` 차트의 라이선스를 따릅니다.
