# Changelog

All notable changes to Truth Lens are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-02-27

### 🎉 Initial Release

#### Added
- **Ensemble ML System**
  - XGBoost classifier (400 estimators, max_depth=6, LR=0.04)
  - Random Forest classifier (300 estimators, max_depth=12)
  - Ensemble fusion (average prediction)
  
- **Feature Engineering**
  - 63-dimensional acoustic feature extraction
  - MFCC coefficients (40 features)
  - Chroma features (12 features)
  - Spectral contrast (7 features)
  - Spectral descriptors (4 features)
  
- **Intelligence Layer**
  - Out-of-distribution detection (Mahalanobis distance)
  - 3-tier risk classification system (Tier 1/2/3)
  - Composite risk scoring [0-100]
  
- **Explainability**
  - SHAP TreeExplainer integration
  - Feature attribution visualization
  - Waterfall plots for decision explanation
  
- **Forensic Reporting**
  - PDF report generation with ReportLab
  - Waveform and spectrogram visualizations
  - SHA-256 integrity hashing
  - Timestamp documentation (ISO 8601)
  
- **Web Interface**
  - Streamlit-based UI
  - Real-time processing dashboard
  - File upload (WAV/MP3 support)
  - Interactive visualizations
  
- **Deployment**
  - Docker containerization (Dockerfile + docker-compose.yml)
  - Makefile for development commands
  - Automated setup scripts (setup.sh, download_models.sh)
  
- **Documentation**
  - 7 comprehensive PDF documents
  - README with badges and screenshots
  - API documentation
  - Contribution guidelines

#### Performance
- Accuracy: 94.2% on ASVspoof 2019 dataset
- ROC-AUC: 0.982
- Precision: 93.8%
- Recall: 94.6%
- F1-Score: 94.2%
- Inference time: <1 second on CPU

#### Security
- No external API calls (local inference)
- Zero audio persistence (GDPR compliant)
- Cryptographic report signing (SHA-256)
- Input validation and file size limits

## [Unreleased]

### Planned for v1.1.0
- [ ] Real-time streaming audio analysis
- [ ] REST API with authentication
- [ ] Multi-language support (Spanish, Mandarin)
- [ ] Browser extension for Chrome/Firefox

### Planned for v1.2.0
- [ ] GPU-accelerated inference
- [ ] Batch processing dashboard
- [ ] Advanced adversarial testing
- [ ] Dataset expansion (50,000+ samples)

### Planned for v2.0.0
- [ ] Multi-modal detection (audio + video)
- [ ] Cloud deployment (AWS, GCP, Azure)
- [ ] SaaS platform with multi-tenancy
- [ ] Compliance certifications (SOC 2, ISO 27001)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for how to contribute to this changelog.

---

**[1.0.0]**: https://github.com/yourusername/truth-lens/releases/tag/v1.0.0
**[Unreleased]**: https://github.com/yourusername/truth-lens/compare/v1.0.0...HEAD
