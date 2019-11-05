FROM swift:5.1

ENV SWIFTLINT_REVISION="nn/github-actions-logging"

# Install SwiftLint
RUN git clone --branch $SWIFTLINT_REVISION https://github.com/realm/SwiftLint.git && \
    cd SwiftLint && \
    swift build --configuration release --static-swift-stdlib && \
    mv `swift build --configuration release --static-swift-stdlib --show-bin-path`/swiftlint /usr/bin && \
    cd .. && \
    rm -rf SwiftLint

RUN swiftlint version
CMD ["swiftlint", "lint", "--reporter", "github-actions-logging"]
