<div class="detail this-is-test-record-detail" id="{{id}}" data-scope="{{scope}}" tabindex="-1">
    {{#unless buttonsDisabled}}
    <div class="detail-button-container button-container record-buttons">
        <div class="sub-container clearfix">
            <div class="btn-group actions-btn-group" role="group">
                {{#each buttonList}}
                    {{button name
                             scope=../entityType
                             label=label
                             labelTranslation=labelTranslation
                             style=style
                             hidden=hidden
                             html=html
                             title=title
                             text=text
                             className='btn-xs-wide detail-action-item'
                             disabled=disabled
                    }}
                {{/each}}
                {{#if dropdownItemList}}
                    <button
                        type="button"
                        class="btn btn-default dropdown-toggle dropdown-item-list-button{{#if dropdownItemListEmpty}} hidden{{/if}}"
                        data-toggle="dropdown"
                    ><span class="fas fa-ellipsis-h"></span></button>
                    <ul class="dropdown-menu pull-left">
                        {{#each dropdownItemList}}
                            {{#if this}}
                                {{dropdownItem
                                    name
                                    scope=../entityType
                                    label=label
                                    labelTranslation=labelTranslation
                                    html=html
                                    title=title
                                    text=text
                                    hidden=hidden
                                    disabled=disabled
                                    data=data
                                    className='detail-action-item'
                                }}
                            {{else}}
                                {{#unless @first}}
                                    {{#unless @last}}
                                        <li class="divider"></li>
                                    {{/unless}}
                                {{/unless}}
                            {{/if}}
                        {{/each}}
                    </ul>
                {{/if}}
            </div>
            {{#if navigateButtonsEnabled}}
                <div class="pull-right">
                    <div class="btn-group" role="group">
                        <button
                            type="button"
                            class="btn btn-text btn-icon action {{#unless previousButtonEnabled}} disabled{{/unless}}"
                            data-action="previous"
                            title="{{translate 'Previous Entry'}}"
                            {{#unless previousButtonEnabled}}disabled="disabled"{{/unless}}
                        >
                            <span class="fas fa-chevron-left"></span>
                        </button>
                        <button
                            type="button"
                            class="btn btn-text btn-icon action {{#unless nextButtonEnabled}} disabled{{/unless}}"
                            data-action="next"
                            title="{{translate 'Next Entry'}}"
                            {{#unless nextButtonEnabled}}disabled="disabled"{{/unless}}
                        >
                            <span class="fas fa-chevron-right"></span>
                        </button>
                    </div>
                </div>
            {{/if}}
        </div>
    </div>
    <div class="detail-button-container button-container edit-buttons hidden">
        <div class="sub-container clearfix">
            <div class="btn-group actions-btn-group" role="group">
                {{#each buttonEditList}}
                    {{button name
                             scope=../entityType
                             label=label
                             labelTranslation=labelTranslation
                             style=style
                             hidden=hidden
                             html=html
                             title=title
                             text=text
                             className='btn-xs-wide edit-action-item'
                             disabled=disabled
                    }}
                {{/each}}
                {{#if dropdownEditItemList}}
                    <button
                        type="button"
                        class="btn btn-default dropdown-toggle dropdown-edit-item-list-button{{#if dropdownEditItemListEmpty}} hidden{{/if}}"
                        data-toggle="dropdown"
                    ><span class="fas fa-ellipsis-h"></span></button>
                    <ul class="dropdown-menu pull-left">
                        {{#each dropdownEditItemList}}
                            {{#if this}}
                                {{dropdownItem
                                    name
                                    scope=../entityType
                                    label=label
                                    labelTranslation=labelTranslation
                                    html=html
                                    title=title
                                    text=text
                                    hidden=hidden
                                    disabled=disabled
                                    data=data
                                    className='edit-action-item'
                                }}
                            {{else}}
                                {{#unless @first}}
                                    {{#unless @last}}
                                        <li class="divider"></li>
                                    {{/unless}}
                                {{/unless}}
                            {{/if}}
                        {{/each}}
                    </ul>
                {{/if}}
            </div>
        </div>
    </div>
    {{/unless}}

    <div class="record-grid{{#if isWide}} record-grid-wide{{/if}}{{#if isSmall}} record-grid-small{{/if}}">
        <div>
            {{#if hasMiddleTabs}}
            <div class="tabs middle-tabs btn-group">
                {{#each middleTabDataList}}
                <button
                    class="btn btn-text btn-wide{{#if isActive}} active{{/if}}{{#if hidden}} hidden{{/if}}"
                    data-tab="{{@key}}"
                >{{label}}</button>
                {{/each}}
            </div>
            {{/if}}
            
            {{!-- Panel 1: Product Info (Original middle content) --}}
            <div class="middle">{{{middle}}}</div>

            {{!-- Panel 2: Specifications + Owner (2 columns) --}}
            <div class="cproduct-panel-2 cproduct-panel">
                <div class="row">
                    <div class="col-md-8">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <i class="fas fa-cogs"></i> {{translate 'Thông Tin Kỹ Thuật' scope='CProduct'}}
                                </h4>
                            </div>
                            <div class="panel-body">
                                <div class="cproduct-specifications-container" data-name="specifications"></div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <i class="fas fa-user"></i> {{translate 'Thông Tin Sở Hữu' scope='CProduct'}}
                                </h4>
                            </div>
                            <div class="panel-body">
                                <div class="cproduct-owner-container" data-name="owner"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            {{!-- Panel 3: Related Products (Full width) --}}
            <div class="cproduct-panel-3 cproduct-panel">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <i class="fas fa-link"></i> {{translate 'Thông tin của các nhà phân phối khác' scope='CProduct'}}
                        </h4>
                    </div>
                    <div class="panel-body">
                        <div class="cproduct-related-container" data-name="relatedProducts"></div>
                    </div>
                </div>
            </div>

            {{!-- Panel 4: Images + History (2 columns) --}}
            <div class="cproduct-panel-4 cproduct-panel">
                <div class="row">
                    <div class="col-md-7">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <i class="fas fa-image"></i> {{translate 'Hình Ảnh Sản Phẩm' scope='CProduct'}}
                                </h4>
                            </div>
                            <div class="panel-body">
                                <div class="cproduct-gallery">
                                    <div class="row">
                                        {{!-- Gallery sẽ được render động bởi JS --}}
                                        <div class="col-md-12">
                                            <div class="cproduct-loading-state">
                                                <div class="spinner">
                                                    <i class="fas fa-spinner fa-spin fa-3x"></i>
                                                </div>
                                                <p>{{translate 'Đang tải ảnh...' scope='CProduct'}}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="cproduct-fullscreen-viewer" class="cproduct-fullscreen-viewer" style="display: none;">
                                    <div class="cproduct-fullscreen-overlay"></div>
                                    <div class="cproduct-fullscreen-content">
                                        <button class="cproduct-fullscreen-close" aria-label="Close">&times;</button>
                                        <div class="cproduct-fullscreen-controls">
                                            <button class="cproduct-zoom-btn cproduct-zoom-in" title="Zoom In">
                                                <i class="fas fa-search-plus"></i>
                                            </button>
                                            <button class="cproduct-zoom-btn cproduct-zoom-out" title="Zoom Out">
                                                <i class="fas fa-search-minus"></i>
                                            </button>
                                            <button class="cproduct-zoom-btn cproduct-zoom-reset" title="Reset Zoom">
                                                <i class="fas fa-compress"></i>
                                            </button>
                                        </div>
                                        <div class="cproduct-fullscreen-image-container">
                                            <img id="cproduct-fullscreen-image" src="" alt="Fullscreen Preview">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-5">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <i class="fas fa-history"></i> {{translate 'Lịch Sử Thay Đổi' scope='CProduct'}}
                                </h4>
                            </div>
                            <div class="panel-body">
                                <div class="cproduct-history-container" data-name="history"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            {{!-- Extra and Bottom content --}}
            <div class="extra">{{{extra}}}</div>
            <div class="bottom">{{{bottom}}}</div>
        </div>
    </div>
</div>


